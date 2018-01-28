//
//  FetchResult.swift
//  DocDocTest
//
//  Created by Aleksandr Konakov on 27/01/2018.
//  Copyright © 2018 Aleksandr Konakov. All rights reserved.
//

import Foundation

enum FetchResult<T: Fetchable> {
    case success(T)
    case error(FetchError)
}
