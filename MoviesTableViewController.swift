//
//  MoviesTableViewController.swift
//  MoviesApp MVC
//
//  Created by Tuna Toramanoğlu on 31.03.2023.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.loadData()

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! MovieDetailVC
        guard let row = tableView.indexPathForSelectedRow?.row else { return }
        
        let movie = movies[row]
        vc.movie = movie
        
    }
    
    func loadData(){
        let path = Bundle.main.path(forResource: "movies", ofType: "json")
        guard let filePath = path, let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe) else { return }
        
        do {
            let fromJsonMovies = try JSONDecoder().decode([Movie].self, from: jsonData)
            movies = fromJsonMovies
            tableView.reloadData()
        }
        catch let error {
            print(error.localizedDescription)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let row = movies[indexPath.row]
        cell.prepare(movie: row)
        return cell
    }
}
