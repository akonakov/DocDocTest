//
//  MockDoctorService.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class MockDoctorService: DoctorService {
    
    func getSpecialities(cityId: String, callback: @escaping (FetchResult<SpecialityList>) -> Void) {
        
        guard let url = Bundle.main.url(forResource: "specialities", withExtension: "json") else {
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
        
        guard let specList = try? JSONDecoder().decode(SpecialityList.self, from: data) else {
            callback(.error(.jsonParsingError))
            return
        }
        
        callback(.success(specList))
    }
    
    func getDoctors(cityId: String?, specialityId: String?, callback: @escaping (FetchResult<DoctorList>) -> Void) {
        
        guard let url = Bundle.main.url(forResource: "doctors", withExtension: "json") else {
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
        
        guard let doctorList = try? JSONDecoder().decode(DoctorList.self, from: data) else {
            callback(.error(.jsonParsingError))
            return
        }
        
        callback(.success(doctorList))
    }
    
    
}
