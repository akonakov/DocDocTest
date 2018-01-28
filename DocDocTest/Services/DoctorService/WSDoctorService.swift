//
//  WSDoctorService.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class WSDoctorService: DoctorService {
    
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
    
    func getSpecialities(cityId: String, callback: @escaping (FetchResult<SpecialityList>) -> Void) {
        
        let url = Config.getSpecialitiesURL.appendingPathComponent("city").appendingPathComponent(cityId)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = WSDataTask.create(session: session, request: request, callback: callback)
        task.resume()
    }
    
    func getDoctors(cityId: String?, specialityId: String?, callback: @escaping (FetchResult<DoctorList>) -> Void) {
        
        var url = Config.getDoctorsURL
        if let cityId = cityId {
            url = url.appendingPathComponent("city").appendingPathComponent(cityId)
        }
        if let specialityId = specialityId {
            url = url.appendingPathComponent("speciality").appendingPathComponent(specialityId)
        }
        url = url.appendingPathComponent("order").appendingPathComponent("name")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = WSDataTask.create(session: session, request: request, callback: callback)
        task.resume()
    }
    
}
