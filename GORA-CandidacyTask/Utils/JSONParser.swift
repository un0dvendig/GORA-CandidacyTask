//
//  JSONParser.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation

class JSONParser {
    
    // MARK: - Properties
    static let shared = JSONParser()
    private let decoder = JSONDecoder()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Methods
    func parseUsers(from data: Data, completion: @escaping ([User]?, Error?) -> Void) {
        do {
            let users = try decoder.decode([User].self, from: data)
            completion(users, nil)
        } catch {
            completion(nil, error)
        }
    }
    
    func parsePhotos(from data: Data, completion: @escaping ([Photo]?, Error?) -> Void) {
        do {
            let photos = try decoder.decode([Photo].self, from: data)
            completion(photos, nil)
        } catch {
            completion(nil, error)
        }
    }
    
    func parseAlbums(from data: Data, completion: @escaping ([Album]?, Error?) -> Void) {
        do {
            let albums = try decoder.decode([Album].self, from: data)
            completion(albums, nil)
        } catch {
            completion(nil, error)
        }
    }
    
}
