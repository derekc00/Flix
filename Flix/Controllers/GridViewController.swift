//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Derek Chang on 1/27/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit
import Nuke

class GridViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tracks: [Track]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //Handles the layout of the movie grid cells
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UICollectionViewCell
        
        if let indexPath = collectionView.indexPath(for: cell),
        let track = tracks?[indexPath.item],
        let detailsViewController = segue.destination as? DetailViewController
        {
            detailsViewController.track = track
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}

// datasource and delegate should be put inside extension to show which
// protocol functions belong to either the delegate or datasource
extension GridViewController: UICollectionViewDelegate {
    
}

extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // THORN: If `withReuseIdentifier` is misspelled, fatal error occurs when this line is executed.
        // This is configured in the storyboard using the attributes inspector
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! GridViewCell
        
        guard let track = tracks?[indexPath.item] else { // check if movie is nil
          print("Movie at \(indexPath.item) is nil")
          return cell
        }
        
        // this could be put inside a helper function bc it is used in other VC's.
        // for now, it is easiest for the student if we duplicate this code
        let posterUrl = URL(string: track.artworkUrl100)!
        Nuke.loadImage(with: posterUrl, into: cell.backdropImageView)
        
        return cell
    }
}
