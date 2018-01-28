//
//  Spec.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

struct Speciality: Codable {
    
    let id: String
    let name: String
    
    private enum CodingKeys : String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
    
}

extension Speciality: Comparable {
    
    static func == (lhs: Speciality, rhs: Speciality) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    static func < (lhs: Speciality, rhs: Speciality) -> Bool {
        return lhs.name < rhs.name
    }
    
}

