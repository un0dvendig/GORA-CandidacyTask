//
//  UsersListDataSource.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 22.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation
import UIKit

class PhotosListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    var photos: [Photo]
    
    // MARK: - Initialization
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserPhotoTableViewCell.identifier, for: indexPath) as? UserPhotoTableViewCell else {
            fatalError("The dequeued cell is not an instance of UserPhotoTableViewCell.")
        }
        
        let photo = photos[indexPath.row]
        cell.configure(with: photo)
        
        return cell
    }
}
