//
//  SpecialitiesViewController.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

class SpecialitiesViewController: BaseViewController {

    @IBOutlet fileprivate weak var cityButton: UIBarButtonItem!
    
    var services: Services!
    var cityId: String!
    var cityName: String!
    
    fileprivate var selectedSpeciality: Speciality?
    
    fileprivate var specialities = [Speciality]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if specialities.isEmpty {
            loadData()
        }
    }
    
    private func loadData() {
        
        startLoading()
        
        services.doctorService.getSpecialities(cityId: cityId) { [weak self] result in
            switch result {
            case .error(let error):
                self?.showError(error)
            case .success(let specList):
                self?.specialities = specList.list.sorted()
                self?.showData()
            }
        }
    }
        
    @IBAction private func cityButtonTapped() {
        performSegue(withIdentifier: "ShowCities", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCities",
            let vc = segue.destination as? CitiesViewController {
            vc.services = services
            vc.delegate = self
            vc.currentCityId = cityId
        } else if segue.identifier == "ShowDoctors",
            let vc = segue.destination as? DoctorsViewController {
            vc.services = services
            vc.cityId = cityId
            vc.specialityId = selectedSpeciality?.id
        }
    }
    
}

// MARK: - UITableViewDataSource
extension SpecialitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SpecialityCell.cellIdentifier, for: indexPath) as! SpecialityCell
        let speciality = specialities[indexPath.row]
        let viewModel = SpecialityCellViewModel(speciality: speciality)
        cell.configure(with: viewModel)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SpecialitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedSpeciality = specialities[indexPath.row]
        performSegue(withIdentifier: "ShowDoctors", sender: nil)
    }
    
}

// MARK: - CitiesViewControllerDelegate
extension SpecialitiesViewController: CitiesViewControllerDelegate {
    
    func citySelected(_ city: City) {
        self.cityId = city.id
        self.cityName = city.name
        dismiss(animated: true) {
            self.loadData()
        }
    }
}
