//
//  MovieCollectionViewCell.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/7/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseIdentifier = "MovieCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    var movie : Movie! {
        didSet {
            nameLabel.text = movie.trackName!.truncate(length: 15)
            
            // Lets apply rounded corners for thumbnail image view
            thumbnailImageView.applyRoundedCorners(radius: 7.0)
            
            // TODO: - Download the thumbnail image from the url
        }
    }
    
    
}
