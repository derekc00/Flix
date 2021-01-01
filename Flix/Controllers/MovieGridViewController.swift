//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Derek Chang on 1/27/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        //Handles the layout of the movie grid cells
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        //makes the height bigger than the width
        layout.itemSize = CGSize(width: width, height: width * 1.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        
        if let movie = movies?[indexPath.item]
        {
            let baseUrl = "https://image.tmdb.org/t/p/w185"
            let posterPath = movie.poster_path
            let posterUrl = URL(string: baseUrl + posterPath)
            cell.posterView.af.setImage(withURL: posterUrl!)
        }
        
        return cell
    }
    
    // MARK: - Navigation

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
