//
//  ViewController.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 19.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let apiWorker = APIWorker.shared
    private let jsonParser = JSONParser.shared
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TESTING
        guard let urlForUsers = URLBuilder()
            .set(scheme: APIScheme.https.rawValue)
            .set(host: APIHost.default.rawValue)
            .set(path: APIPath.users.rawValue)
            .build() else { return }
        
        guard let urlForAlbumsID3 = URLBuilder()
            .set(scheme: APIScheme.https.rawValue)
            .set(host: APIHost.default.rawValue)
            .set(path: APIPath.albums.rawValue)
            .addQueryItem(name: "id", value: "3")
            .build() else { return }
        
        guard let urlForPhotosID2 = URLBuilder()
            .set(scheme: APIScheme.https.rawValue)
            .set(host: APIHost.default.rawValue)
            .set(path: APIPath.photos.rawValue)
            .addQueryItem(name: "id", value: "2")
            .build() else { return }
        
        // users
        apiWorker.fetchData(from: urlForUsers) {
            [weak self] (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }

            if let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data {
                self?.jsonParser.parseUsers(from: data) { (users, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }

                    if let users = users {
                        for user in users {
                            print(user.address.geolocation)
                        }
                    }
                }
            }
        }
        
        // albums
        apiWorker.fetchData(from: urlForAlbumsID3) {
            [weak self] (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }

            if let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data {
                self?.jsonParser.parseAlbums(from: data) { (albums, error) in
                    if let error = error {
                        print("Albums: \(error.localizedDescription)")
                    }

                    if let albums = albums{
                        for album in albums {
                            print(album)
                        }
                    }
                }
            }
        }

        // photos?id=2
        apiWorker.fetchData(from: urlForPhotosID2) {
            [weak self] (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }

            if let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data {
                self?.jsonParser.parsePhotos(from: data) { (photos, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }

                    if let photos = photos {
                        for photo in photos {
                            print(photo)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Private methods
}

