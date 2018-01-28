//
//  MockGeoService.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class MockGeoService: GeoService {
    
    func getCities(callback: @escaping (FetchResult<CityList>) -> Void) {
        
        guard let url = Bundle.main.url(forResource: "cities", withExtension: "json") else {
            callback(.error(.dataError))
            return
        }
        
        guard let jsonString = try? String(contentsOf: url) else {
            callback(.error(.dataError))
            return
        }
        
        guard let data = jsonString.data(using: .utf8) else {
            callback(.error(.dataError))
            return
        }
        
        guard let cityList = try? JSONDecoder().decode(CityList.self, from: data) else {
            callback(.error(.jsonParsingError))
            return
        }
        
        let sortedList = cityList.list.sorted { $0.name < $1.name }
        callback(.success(CityList(list: sortedList)))
    }
}
