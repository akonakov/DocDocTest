//
//  GeoService.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

protocol GeoService {
    
    // Получение списка городов
    func getCities(callback: @escaping (FetchResult<CityList>) -> Void)
}
