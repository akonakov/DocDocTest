//
//  DoctorCellViewModel.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class DoctorCellViewModel {
    
    private let doctor: Doctor
    
    init(doctor: Doctor) {
        self.doctor = doctor
    }
    
    var name: String {
        return doctor.name
    }
}
