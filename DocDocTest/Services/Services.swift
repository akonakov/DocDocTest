//
//  Services.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class Services {
    
    let geoService: GeoService
    let doctorService: DoctorService
    
    init(geoService: GeoService, doctorService: DoctorService) {
        self.geoService = geoService
        self.doctorService = doctorService
    }
    
}
