//
//  UserPhotosTableViewController.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 20.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import UIKit

class UserPhotosTableViewController: UITableViewController {

    // MARK: - Properties
    var userId: Int?
    
    private let apiWorker = APIWorker.shared
    private let jsonParser = JSONParser.shared
    private var dataSource: PhotosListDataSource! {
        didSet {
            DispatchQueue.main.async {
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ViewControllerTitle.photos.rawValue.localized
        
        tableView?.register(UserPhotoTableViewCell.nib, forCellReuseIdentifier: UserPhotoTableViewCell.identifier)
        
        downloadAndParsePhotos()
    }
    
    // MARK: - Private methods
    private func downloadAndParsePhotos() {
        guard let userId = userId else { return }
        let id = String(userId)
        
        guard let photosURL = URLBuilder()
            .set(scheme: APIScheme.https.rawValue)
            .set(host: APIHost.default.rawValue)
            .set(path: APIPath.photos.rawValue)
            .addQueryItem(name: "id", value: id)
            .build() else { return }
        
        apiWorker.fetchData(from: photosURL) {
            [weak self] (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }

            if let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data {
                self?.jsonParser.parsePhotos(from: data) {
                    (photos, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }

                    if let photos = photos {
                        self?.dataSource = PhotosListDataSource(photos: photos)
                    }
                }
            }
        }
    }
}
