//
//  Config.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

enum Config {
    
    static let login = "partner.13703"
    static let password = "ZZdFmtJD"
    
    static let getCitiesURL = URL(string: "https://api.docdoc.ru/public/rest/1.0.9/city")!
    static let getSpecialitiesURL = URL(string: "https://api.docdoc.ru/public/rest/1.0.9/speciality")!
    static let getDoctorsURL = URL(string: "https://api.docdoc.ru/public/rest/1.0.9/doctor/list")!
}
