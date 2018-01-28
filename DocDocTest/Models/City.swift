//
//  City.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

struct City: Codable {
    
    let id: String
    let name: String
    
    private enum CodingKeys : String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

extension City: Comparable {
    
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    static func < (lhs: City, rhs: City) -> Bool {
        return lhs.name < rhs.name
    }
    
}
