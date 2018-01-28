//
//  WSDataTask.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

class WSDataTask {
    
    static func create<T: Decodable>(session: URLSession, request: URLRequest, callback: @escaping (FetchResult<T>) -> Void) -> URLSessionDataTask {
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(.error(.httpError))
                return
            }
            guard let data = data else {
                callback(.error(.dataError))
                return
            }
            
            guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                callback(.error(.jsonParsingError))
                return
            }
            
            callback(.success(result))
        }
        
        return dataTask
        
    }
    
}
