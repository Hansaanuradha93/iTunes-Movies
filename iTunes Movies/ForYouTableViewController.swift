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
    static let segueIdentifier = "goToMovieDetailsVC"
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ForYouTableViewController.segueIdentifier {            
            let destinationVC = segue.destination as! MovieDetailsViewController
            
            if let indexPath = sender as? IndexPath, let showcaseCell = tableView.cellForRow(at: indexPath) as? ShowcaseTableViewCell {
                
                destinationVC.image = showcaseCell.bannerImage
                destinationVC.movie = self.movies[indexPath.row]
            }
        }
    }



 

}


// MARK: - Table view data source

extension ForYouTableViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Lets return the 1st row and 3rd cell
        if (indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 0 && indexPath.row == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: ShowcaseTableViewCell.reuseIdentifier, for: indexPath) as! ShowcaseTableViewCell
            
            if movies.count > 0 {
                cell.movie = movies[indexPath.row]
            }
            
            cell.selectionStyle = .none
            
            return cell
        }
            // Lets return the 2nd row and 4th cell
        else if (indexPath.section == 0 && indexPath.row == 1) || (indexPath.section == 0 && indexPath.row == 3) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier, for: indexPath) as! MovieTableViewCell
            
            cell.movies = movies
            
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // Lets set the first row cell height
        if (indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 0 && indexPath.row == 2) {
            return 222.0
        } else if (indexPath.section == 0 && indexPath.row == 1) || (indexPath.section == 0 && indexPath.row == 3) {
            return 305.0
        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
}


// MARK: - Table view delagate

extension ForYouTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 0 && indexPath.row == 2) {
            
            self.performSegue(withIdentifier: ForYouTableViewController.segueIdentifier, sender: indexPath)
        }
    }
}

