//
//  Photo.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

struct Photo: Codable {
    
    // MARK: - Properties
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
