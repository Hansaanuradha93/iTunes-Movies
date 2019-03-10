//
//  ItunesClient.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/9/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import Foundation

class ItunesClient {
    
    // Lets fetch movies here
    func fetchMovies(withTerm term : String, inEntity entity : String, completion : @escaping ([Movie]?) -> Void) {
        
        // Search endpoint
        let searchEndPoint = ItunesEndpoint.search(term: term, entity: entity)
        
        // Url Request
        let urlRequest = searchEndPoint.request
        
        // Network processor
        let networkProcessor = NetworkProcessor(request: urlRequest)
        
        // Lets dowload the json here
        networkProcessor.downloadJSON { (jsonResponse, httpResponse, error) in
            
            // Lets check to see the json is not nil
            guard let json = jsonResponse, let resultDictionaries = json["results"] as? [[String : Any]] else {
                completion(nil)
                return
            }
            
            
            DispatchQueue.main.async {
                
                // Lets check to see all the elemets of this array are not nil
                let movies = resultDictionaries.compactMap({ movieDictionary in
                    return Movie(dictionary : movieDictionary)
                })
                
                completion(movies)
            }
            
        }
        
    }
    
}
