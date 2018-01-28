//
//  CityCell.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    
    static let cellIdentifier = "CityCell"
    
    func configure(with viewModel: CityCellViewModel) {
        textLabel?.text = viewModel.name
        accessoryType = viewModel.checked ? .checkmark : .none
    }
    
}
