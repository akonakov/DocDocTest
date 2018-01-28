//
//  WSDoctorService.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class WSGeoService: GeoService {
    
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        
        let loginData = "\(Config.login):\(Config.password)".data(using: .utf8)!
        let authorizationString = loginData.base64EncodedString()
        
        config.httpAdditionalHeaders = [
            "Authorization": "Basic \(authorizationString)"
        ]
        self.session = URLSession(configuration: config)
    }
    
    func getCities(callback: @escaping (FetchResult<CityList>) -> Void) {
        
        let url = Config.getCitiesURL
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = WSDataTask.create(session: session, request: request, callback: callback)
        task.resume()
    }
    
}
