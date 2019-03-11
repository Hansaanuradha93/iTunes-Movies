//
//  ItunesSearchViewController.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/11/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class ItunesSearchViewController: UIViewController {

    
    // MARK: - Properties
    let itunesClient = ItunesClient()
    var movies = [Movie]()
    let movieCollectionDatasource = MovieCollectionDataSource()
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delagate
        searchBar.delegate = self
        definesPresentationContext = true
        
        // set the collection view data source here
        collectionView.dataSource = movieCollectionDatasource
    }
    


}

// MARK: - Search Bar Delegate


extension ItunesSearchViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let text = searchBar.text {
            
            itunesClient.fetchMovies(withTerm: text, inEntity: "movie") { (movies) in
                self.movies = []
                self.collectionView.reloadData()
                
                if let movies = movies {
                    self.movieCollectionDatasource.update(with: movies)
                    self.collectionView.reloadData()
                }
            }
        }
    }
}








