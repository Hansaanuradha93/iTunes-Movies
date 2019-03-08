//
//  MovieDetailsViewController.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/8/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit


class MovieDetailsViewController: UIViewController {

    
    // MARK: - Properites
    var movie : Movie!
    var image : UIImage!
    
    
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
        
        
    }
    

    // MARK: - IBActions
    @IBAction func playTrailerButtonTapped(_ sender: UIButton) {
        print("Lets play the trailer")
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
