//
//  URLBuilder.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

class URLBuilder {
    
    // MARL: - Properties
    private var components: URLComponents
    
    // MARK: - Initialization
    init() {
        self.components = URLComponents()
    }
    
    // MARK: - Methods
    func set(scheme: String) -> URLBuilder {
        self.components.scheme = scheme
        return self
    }
    
    func set(host: String) -> URLBuilder {
        self.components.host = host
        return self
    }
    
    func set(path: String) -> URLBuilder {
        var path = path
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        self.components.path = path
        return self
    }
    
    func addQueryItem(name: String, value: String?) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        
        let queryItem = URLQueryItem(name: name, value: value)
        self.components.queryItems?.append(queryItem)
        return self
    }
    
    func build() -> URL? {
        return self.components.url
    }
}
