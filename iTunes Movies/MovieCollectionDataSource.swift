//
//  MovieCollectionDataSource.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/7/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class MovieCollectionDataSource : NSObject {
    
    
    // MARK: - Properties
    private var movies = [Movie]()
    
    // MARK: - Initializer
    override init() {
        super.init()
    }
    
    // MARK: - Support Functions
    func update(with movies : [Movie]) {
        self.movies = movies
    }

    

}


// MARK: - Collection View Datasource

extension MovieCollectionDataSource : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        cell.movie = movies[indexPath.item]
        return cell
    }
}
