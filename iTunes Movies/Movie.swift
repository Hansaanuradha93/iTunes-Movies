//
//  Movie.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/6/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import Foundation

struct Movie : Decodable {
    
    let artistName : String?
    
    /// Name of the movie
    let trackName : String?
    
    let trackCensoredName : String?
    
    /// The url to go to this movie page in itunes
    let trackViewUrl : String?
    
    /// Movie trailer url
    let previewUrl : String?
    
    /// Url of the movie picture
    let artworkUrl60 : String?
    let artworkUrl100 : String?
    
    let longDescription : String?
    let primaryGenreName : String?
    
    let trackPrice : Double?
    
    let trackRentalPrice : Double?
    
    // Initializer
    init?(dictionary : [String : Any]) {
        
        guard let artistName = dictionary["artistName"] as? String,
            let trackName = dictionary["trackName"] as? String,
            let trackCensoredName = dictionary["trackCensoredName"] as? String,
            let trackViewUrl = dictionary["trackViewUrl"] as? String,
            let previewUrl = dictionary["previewUrl"] as? String,
            let artworkUrl60 = dictionary["artworkUrl60"] as? String,
            let artworkUrl100 = dictionary["artworkUrl100"] as? String,
            let longDescription = dictionary["longDescription"] as? String,
            let primaryGenreName = dictionary["primaryGenreName"] as? String,
            let trackPrice = dictionary["trackPrice"] as? Double,
            let trackRentalPrice = dictionary["trackRentalPrice"] as? Double
            else {
                return nil
        }
        
        self.trackName = trackName
        self.artistName = artistName
        self.trackCensoredName = trackCensoredName
        self.trackViewUrl = trackViewUrl
        self.previewUrl = previewUrl
        self.artworkUrl60 = artworkUrl60
        self.artworkUrl100 = artworkUrl100.replacingOccurrences(of: "100x100", with: "150x150")
        self.longDescription = longDescription
        self.primaryGenreName = primaryGenreName
        self.trackPrice = trackPrice
        self.trackRentalPrice = trackRentalPrice
        
    }
    
}
