//
//  DoctorCell.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

class DoctorCell: UITableViewCell {
    
    static let cellIdentifier = "DoctorCell"
    
    func configure(with viewModel: DoctorCellViewModel) {
        textLabel?.text = viewModel.name
    }
    
}
