//
//  UserPhotoTableViewCell.swift
//  GORA-CandidacyTask
//
//  Created by Eugene Ilyin on 20.02.2020.
//  Copyright © 2020 Eugene Ilyin. All rights reserved.
//

import UIKit

class UserPhotoTableViewCell: UITableViewCell {

    // MARK: - Properties
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var additionalBackgroundView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoLoadingActivityIndicator: UIActivityIndicatorView!
    
    // MARK: - UITableViewCell methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func configure(with photo: Photo) {
        let userPhotoViewModel = UserPhotoViewModel(photoModel: photo)
        
        setupAdditionalBackground()
        
        photoLoadingActivityIndicator.startAnimating()
        
        photoTitleLabel.text = userPhotoViewModel.title
        
        photoImageView.downloadImage(from: userPhotoViewModel.url) {
            (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            self.photoLoadingActivityIndicator.stopAnimating()
        }
        
    }
    
    // MARK: - Private methods
    private func setupAdditionalBackground() {
        additionalBackgroundView.layer.cornerRadius = 5
        additionalBackgroundView.layer.borderWidth = 1
        additionalBackgroundView.layer.borderColor = UIColor.gray.cgColor
    }
    
}
