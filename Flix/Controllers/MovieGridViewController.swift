//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Derek Chang on 1/27/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit
import Nuke

class MovieGridViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie]? {
        didSet {
            if collectionView != nil {
                collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //Handles the layout of the movie grid cells
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.5)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UICollectionViewCell
        
        if let indexPath = collectionView.indexPath(for: cell),
        let movie = movies?[indexPath.item],
        let detailsViewController = segue.destination as? MovieDetailsViewController
        {
            detailsViewController.movie = movie
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}

// datasource and delegate should be put inside extension to show which
// protocol functions belong to either the delegate or datasource
extension MovieGridViewController: UICollectionViewDelegate {
    
}

extension MovieGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // THORN: If `withReuseIdentifier` is misspelled, fatal error occurs when this line is executed.
        // This is configured in the storyboard using the attributes inspector
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        guard let movie = movies?[indexPath.item] else { // check if movie is nil
          print("Movie at \(indexPath.item) is nil")
          return cell
        }
        
        // this could be put inside a helper function bc it is used in other VC's.
        // for now, it is easiest for the student if we duplicate this code
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie.poster_path
        let posterUrl = URL(string: baseUrl + posterPath)!
        Nuke.loadImage(with: posterUrl, into: cell.posterView)
        
        return cell
    }
}
