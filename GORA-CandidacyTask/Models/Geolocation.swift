//
//  Geolocation.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

struct Geolocation: Codable {
    
    // MARK: - Properties
    var latitude: String
    var longitude: String
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}
