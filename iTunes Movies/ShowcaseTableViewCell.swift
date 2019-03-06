//
//  ShowcaseTableViewCell.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/6/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class ShowcaseTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let reuseIdentifier = "ShowcaseCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var movie : Movie! {
        didSet {
            nameLabel.text = movie.trackName!
            genreLabel.text = movie.primaryGenreName!
            
            // TODO: Make a request to download thumbnail and banner images
        
            thumbnailImageView.layer.cornerRadius = 7.0
            thumbnailImageView.layer.masksToBounds = true
        }
    }
    

    
    
    
}
