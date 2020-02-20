//
//  StringConstants.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

enum APIScheme: String {
    case http = "http"
    case https = "https"
}

enum APIHost: String {
    case `default` = "jsonplaceholder.typicode.com"
}

enum APIPath: String {
    case albums = "albums"
    case users = "users"
    case photos = "photos"
}

enum ViewControllerTitle: String {
    case users = "UsersTitle"
    case photos = "PhotosTitle"
}
