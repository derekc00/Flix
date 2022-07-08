//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Derek Chang on 1/27/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
//    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    //create optional property for Movie. Will be populated by the origin class's prepare method
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie?.title
        titleLabel.sizeToFit() //Prevents the text from getting cut-off with "..."
        
        synopsisLabel.text = movie?.overview
        synopsisLabel.sizeToFit()
//        let baseUrl = "https://image.tmdb.org/t/p/w185"

//        if let posterPath = movie?.poster_path,
//           let posterUrl = URL(string: baseUrl + posterPath)
//        {
//            posterView.af.setImage(withURL: posterUrl)
//        }
        
        // place image in the backdrop
        if let backdropPath = movie?.backdrop_path,
           let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        {
            backdropView.af.setImage(withURL: backdropURL)
        }
        
    }
}
