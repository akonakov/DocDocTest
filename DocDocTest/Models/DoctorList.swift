//
//  DoctorList.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

struct DoctorList: Codable, Fetchable {
    
    let list: [Doctor]
    
    private enum CodingKeys : String, CodingKey {
        case list = "DoctorList"
    }
}
