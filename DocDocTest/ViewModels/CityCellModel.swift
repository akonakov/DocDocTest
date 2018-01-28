//
//  CityCellModel.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class CityCellViewModel {
    
    private let city: City
    private let isCurrent: Bool
    
    init(city: City, isCurrent: Bool) {
        self.city = city
        self.isCurrent = isCurrent
    }
    
    var name: String {
        return city.name
    }
    
    var checked: Bool {
        return isCurrent
    }
}
