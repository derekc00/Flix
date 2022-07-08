//
//  MoviesViewController.swift
//  Flix
//
//  Created by Derek Chang on 1/12/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit
import Kingfisher
//import AlamofireImage
import Nuke

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // no need to call super.prepare() bc by default, it does nothing.
        
         //Get the new view controller using segue.destination.
         //Pass the selected object to the new view controller.
        
        //Find the selected movie
        if
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let movie = movies?[indexPath.row]
        {
            //Pass the selected movie to the details movies controller
            let detailsViewController = segue.destination as! MovieDetailsViewController
            
            //There is a variable in the class that we want to send stuff to that we define here
            detailsViewController.movie = movie
            
            //Deselects the row after you come back to the view
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        if let movie = movies?[indexPath.row] {
            
            cell.titleLabel.text = movie.title
            cell.synopsisLabel.text = movie.overview
            
            let baseUrl = "https://image.tmdb.org/t/p/w185"
            let posterPath = movie.poster_path
            let posterUrl = URL(string: baseUrl + posterPath)!
            
//            cell.posterView.kf.setImage(with: posterUrl)
//            cell.posterView.af.setImage(withURL: posterUrl)
            Nuke.loadImage(with: posterUrl, into: cell.posterView)
        }
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate { }
