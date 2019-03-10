//
//  ItnuesEndPoint.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/8/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import Foundation

// Lets construct Url we want
//https://itunes.apple.com/search?term=ironman&entity=movie

enum ItunesEndpoint {
    
    // Cases
    case search(term : String, entity : String)
    
    
    // Url request
    var request : URLRequest {
        
        var components = URLComponents(string: baseURL)!
        components.path = path
        components.queryItems = queryComponents
        
        let url = components.url!
        return URLRequest(url: url)
    }
    
    // Base URL
    private var baseURL : String {
        return "https://itunes.apple.com/"
    }
    
    // Path
    private var path : String {
        switch self {
            case .search : return "/search"
        }
    }
    
    
    // Parameters
    private var parameters : [String : Any] {
        
        switch self {

        case .search(let term, let entity) :
            let parameters : [String : Any] = [
                "term" : term,
                "entity" : entity
            ]
            
            return parameters
        }
        
    }
    
    // Query Components
    private var queryComponents : [URLQueryItem] {
        var components = [URLQueryItem]()
        
        for (key, value) in parameters {
            
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.append(queryItem)
            
        }
        
        return components
    }
    
    
    
    
    
}


