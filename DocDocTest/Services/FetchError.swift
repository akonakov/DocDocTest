//
//  FetchError.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

enum FetchError: Error {
    case httpError
    case dataError
    case jsonParsingError
}

extension FetchError: CustomStringConvertible {
    var description: String {
        switch self {
        case .httpError:
            return "Ошибка при обращении к серверу"
        case .dataError:
            return "Ошибка при получении данных"
        case .jsonParsingError:
            return "Неверный формат данных"
        }
    }
}
