//
//  User.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

struct User: Codable {
    
    // MARK: - Properties
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}
