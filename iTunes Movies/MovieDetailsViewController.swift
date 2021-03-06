//
//  MovieDetailsViewController.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/8/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit
import AVKit

class MovieDetailsViewController: UIViewController {

    
    // MARK: - Properites
    var movie : Movie!
    var image : UIImage!
    
    // video player properties
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    

    
    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Lets display the images here
        if let image = image {
            bannerImageView.image = image
            posterImageView.image = image
        } else {
            //  TODO: - Download images
        }
        
        // Lets set labels here
        genreLabel.text = movie.primaryGenreName!
        nameLabel.text = movie.trackName!
        descriptionLabel.text = movie.longDescription!
        
        // Lets add rounded corners for poster image view
        posterImageView.applyRoundedCorners(radius: 7.0)
        
        
    }
    

    // MARK: - IBActions
    @IBAction func playTrailerButtonTapped(_ sender: UIButton) {
        
        if let trailerUrlString = movie.previewUrl, let trailerUrl = URL(string: trailerUrlString) {
            
            player = AVPlayer(url: trailerUrl)
            playerViewController.player = player
            
            present(playerViewController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
