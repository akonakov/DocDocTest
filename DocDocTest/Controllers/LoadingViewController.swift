//
//  LoadingViewController.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    fileprivate var cityId: String?
    fileprivate var cityName: String?
    
    private var services: Services?
    fileprivate let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        resetCurrentCity()
        
//        let geoService = MockGeoService()
//        let doctorService = MockDoctorService()
        let geoService = WSGeoService()
        let doctorService = WSDoctorService()

        services = Services(geoService: geoService, doctorService: doctorService)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let cityId = userDefaults.string(forKey: "cityId"),
            let cityName = userDefaults.string(forKey: "cityName") {
            self.cityId = cityId
            self.cityName = cityName
            performSegue(withIdentifier: "ShowSpecialities", sender: nil)
        } else {
            performSegue(withIdentifier: "ShowCities", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSpecialities" {
            if let navVC = segue.destination as? UINavigationController,
                let vc = navVC.topViewController as? SpecialitiesViewController {
                vc.cityId = cityId
                vc.cityName = cityName
                vc.services = services
            }
        } else if segue.identifier == "ShowCities",
            let vc = segue.destination as? CitiesViewController {
            vc.services = services
            vc.delegate = self
        }
    }
    
    fileprivate func getCurrentCity() -> (String, String)? {
        if let cityId = userDefaults.string(forKey: "cityId"),
            let cityName = userDefaults.string(forKey: "cityName") {
            return (id: cityId, name: cityName)
        } else {
            return nil
        }
    }
    
    private func resetCurrentCity() {
        userDefaults.removeObject(forKey: "cityId")
        userDefaults.removeObject(forKey: "cityName")
        userDefaults.synchronize()
    }
}

// MARK: - CitiesViewControllerDelegate
extension LoadingViewController: CitiesViewControllerDelegate {
    func citySelected(_ city: City) {
        self.cityId = city.id
        self.cityName = city.name
        self.performSegue(withIdentifier: "ShowSpecialities", sender: nil)
        dismiss(animated: true)
    }
}
