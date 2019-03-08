//
//  MovieTableViewCell.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/6/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let reuseIdentifier = "MovieTableViewCell"
    let movieCollectionDatasource = MovieCollectionDataSource()

    
    // MARK: - IBOutlets
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movies : [Movie]! {
        didSet {
            sectionTitleLabel.text = "Recommended"
            movieCollectionView.dataSource = movieCollectionDatasource
            movieCollectionDatasource.update(with: movies)
            movieCollectionView.reloadData()
        }
    }
    
}
