//
//  SpecialityCell.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import UIKit

class SpecialityCell: UITableViewCell {
    
    static let cellIdentifier = "SpecialityCell"
    
    func configure(with viewModel: SpecialityCellViewModel) {
        textLabel?.text = viewModel.name
    }

}
