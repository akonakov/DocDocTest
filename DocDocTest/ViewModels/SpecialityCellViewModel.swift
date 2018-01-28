//
//  SpecialityCellViewModel.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class SpecialityCellViewModel {
    
    private let speciality: Speciality
    
    init(speciality: Speciality) {
        self.speciality = speciality
    }
    
    var name: String {
        return speciality.name
    }
}
