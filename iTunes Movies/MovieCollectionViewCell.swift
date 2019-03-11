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
     
            // Lets Download the thumbnail image from the url
            if let thumbnailUrl = URL(string: movie.artworkUrl100!) {
                
                // Url request
                let urlRequest = URLRequest(url: thumbnailUrl)
                
                // Network processor
                let networkProcessor = NetworkProcessor(request: urlRequest)
                
                // Lets donwload the image data from the network processor
                networkProcessor.downloadData { [weak self](data, httpsResponse, error) in
                    if error == nil {
                        if let imageData = data {
                            // Lets move to the main queue
                            DispatchQueue.main.async {
                                let image = UIImage(data: imageData)
                                self?.thumbnailImageView.image = image
                                // Lets apply rounded corners for thumbnail image view
                                self?.thumbnailImageView.applyRoundedCorners(radius: 7.0)
                                
                            }
                        }
                    }
                }
            }
            
            
            
        }
    }
    
    
}
