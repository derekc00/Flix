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
    
    var tracks: [Track]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Required to change row height
        tableView.rowHeight = UITableView.automaticDimension

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
            let track = tracks?[indexPath.row]
        {
            //Pass the selected movie to the details movies controller
            let detailViewController = segue.destination as! DetailViewController
            
            //There is a variable in the class that we want to send stuff to that we define here
            detailViewController.track = track
            
            //Deselects the row after you come back to the view
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! TableViewCell
        
        if let track = tracks?[indexPath.row] {
            
            cell.titleLabel.text = track.trackName
            cell.subtextLabel.text = track.artistName
            let artworkUrl = URL(string: track.artworkUrl100)!
            Nuke.loadImage(with: artworkUrl, into: cell.backdropImageView)
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
}
