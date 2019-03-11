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
    var bannerImage : UIImage!
    
    // MARK: - IBOutlets
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var movie : Movie! {
        didSet {
            nameLabel.text = movie.trackName!
            genreLabel.text = movie.primaryGenreName!
            
            //Lets Make a request to download thumbnail and banner images
            
            if let thumbnailrUrl = URL(string: movie.artworkUrl100!) {
                
                // Url request
                let urlRequest = URLRequest(url: thumbnailrUrl)
                // network processor from the url request
                let networkProcessor = NetworkProcessor(request: urlRequest)
                
                // Lets download the data from network processor
                networkProcessor.downloadData { [weak self](data, httpResponse, error) in
                    
                    if error == nil {
                        if let imageData = data {
                            // Lets move to the main queue
                            DispatchQueue.main.async {
                                let image = UIImage(data: imageData)
                                self?.bannerImage = image
                                self?.thumbnailImageView.image = image
                                self?.bannerImageView.image = image
                                
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
