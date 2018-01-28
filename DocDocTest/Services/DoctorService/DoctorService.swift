//
//  DoctorService.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

protocol DoctorService {
    
    // Получение списка специальностей
    func getSpecialities(cityId: String, callback: @escaping (FetchResult<SpecialityList>) -> Void)
    
    // Получение списка врачей
    func getDoctors(cityId: String?, specialityId: String?, callback: @escaping (FetchResult<DoctorList>) -> Void)
}
