//
//  DoctorsViewController.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

class DoctorsViewController: BaseViewController {
    
    var services: Services!
    var cityId: String!
    var specialityId: String!
    
    fileprivate var doctors = [Doctor]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
    }
    
    func loadData() {
        
        startLoading()
        
        services.doctorService.getDoctors(cityId: cityId, specialityId: specialityId) { [weak self] result in
            switch result {
            case .error(let error):
                self?.showError(error)
            case .success(let doctorList):
                self?.doctors = doctorList.list.sorted()
                self?.showData()
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension DoctorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DoctorCell.cellIdentifier, for: indexPath) as! DoctorCell
        let doctor = doctors[indexPath.row]
        let viewModel = DoctorCellViewModel(doctor: doctor)
        cell.configure(with: viewModel)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DoctorsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
