//
//  Doctor.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

struct Doctor: Codable {
    
    let id: Int
    let name: String
    
    private enum CodingKeys : String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
    
}

extension Doctor: Comparable {
    
    static func == (lhs: Doctor, rhs: Doctor) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    static func < (lhs: Doctor, rhs: Doctor) -> Bool {
        return lhs.name < rhs.name
    }
    
}

