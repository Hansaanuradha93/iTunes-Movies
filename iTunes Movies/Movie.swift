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
    
}
