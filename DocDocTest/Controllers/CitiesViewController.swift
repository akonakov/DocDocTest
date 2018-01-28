//
//  CitiesViewController.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

protocol CitiesViewControllerDelegate: class {
    func citySelected(_ city: City)
}

class CitiesViewController: BaseViewController {

    var services: Services!
    weak var delegate: CitiesViewControllerDelegate?
    
    var currentCityId: String?
    
    fileprivate var cities = [City]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
    }
    
    private func loadData() {
        
        startLoading()
        
        services.geoService.getCities() { [weak self] result in
            switch result {
            case .error(let error):
                self?.showError(error)
            case .success(let cityList):
                self?.cities = cityList.list.sorted()
                self?.showData()
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension CitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.cellIdentifier, for: indexPath) as! CityCell
        let city = cities[indexPath.row]
        let viewModel = CityCellViewModel(city: city, isCurrent: city.id == currentCityId)
        cell.configure(with: viewModel)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = cities[indexPath.row]
        saveCurrentCity(id: city.id, name: city.name)
        delegate?.citySelected(city)
    }
    
    private func saveCurrentCity(id: String, name: String) {
        UserDefaults.standard.set(id, forKey: "cityId")
        UserDefaults.standard.set(name, forKey: "cityName")
        UserDefaults.standard.synchronize()
    }
}
