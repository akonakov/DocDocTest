//
//  SpecialityList.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

struct SpecialityList: Codable, Fetchable {
    
    let list: [Speciality]
    
    private enum CodingKeys : String, CodingKey {
        case list = "SpecList"
    }
}
