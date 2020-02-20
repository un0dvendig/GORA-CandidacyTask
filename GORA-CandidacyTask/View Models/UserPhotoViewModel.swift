//
//  UserPhotoViewModel.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 20.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import Foundation
import UIKit

class UserPhotoViewModel {
    
    // MARK: - Properties
    private let photo: Photo
    private let imageURL: URL
    
    // MARK: - Initialization
    init(photoModel photo: Photo) {
        self.photo = photo
        self.imageURL = URL(string: photo.url)!
    }
    
    // MARK: - Computed properties
    public var title: String {
        return photo.title
    }
    
    public var url: URL {
        return imageURL
    }
}
