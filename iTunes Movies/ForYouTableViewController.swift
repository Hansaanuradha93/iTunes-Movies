//
//  ForYouTableViewController.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/6/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class ForYouTableViewController: UITableViewController {

    // MARK: - Properties
    var movies = [Movie]()
    
    
    // MARK: - View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Lets fetch movies from the json here
        fetchMovies()
    }

    // MARK: - Support methods
    func fetchMovies() {
        
        let forYouJSONPath = Bundle.main.path(forResource: "Seeds", ofType: "json")!

        let url = URL(fileURLWithPath: forYouJSONPath)
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        do {
            let json = try JSONDecoder().decode([String : [Movie]].self, from: data)
            
            if let movies = json["results"] {
                DispatchQueue.main.async {
                    // Lets get the list of movies here
                    self.movies = movies
                    self.tableView.reloadData()
                }
            }
            
        } catch {
            print("Error serializing json: \(error)")
        }
        
    }


 

}


// MARK: - Table view data source

extension ForYouTableViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Lets return the first row cell
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ShowcaseTableViewCell.reuseIdentifier, for: indexPath) as! ShowcaseTableViewCell
            
            if movies.count > 0 {
                cell.movie = movies[0]
            }
            
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // Lets set the first row cell height
        if indexPath.section == 0 && indexPath.row == 0 {
            return 222.0
        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
}