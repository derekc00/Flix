//
//  MoviesViewController.swift
//  Flix
//
//  Created by Derek Chang on 1/12/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit
import Nuke

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Required to change row height
        tableView.rowHeight = UITableView.automaticDimension

        // Required to fix nav bar having a clear background with iOS 15 update
        // see here: https://developer.apple.com/forums/thread/682420
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
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
            let data = dataArray?[indexPath.row]
        {
            //Pass the selected movie to the details movies controller
            let detailViewController = segue.destination as! DetailViewController
            
            //There is a variable in the class that we want to send stuff to that we define here
            detailViewController.data = data
            
            //Deselects the row after you come back to the view
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! TableViewCell
        
        if let movie = dataArray?[indexPath.row] {
            
            cell.titleLabel.text = movie.title
            cell.subtextLabel.text = movie.overview
            let baseUrl = "https://image.tmdb.org/t/p/w780"
            let posterPath = movie.backdrop_path
            let posterUrl = URL(string: baseUrl + posterPath)!
            Nuke.loadImage(with: posterUrl, into: cell.backdropImageView)
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    // This creates a mask over each cell to give it the 'card' look
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let inset: CGFloat = 8
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10    //if you want round edges
        maskLayer.backgroundColor = UIColor.green.cgColor
        maskLayer.frame = cell.bounds.inset(by: UIEdgeInsets(top: inset,
                                                             left: inset,
                                                             bottom: inset,
                                                             right: inset))
        cell.layer.mask = maskLayer
    }
    
}
