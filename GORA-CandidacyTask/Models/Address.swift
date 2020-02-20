//
//  Address.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

struct Address: Codable {
    
    // MARK: - Properties
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geolocation: Geolocation
    
    enum CodingKeys: String, CodingKey {
        case street
        case suite
        case city
        case zipcode
        case geolocation = "geo"
    }
}
