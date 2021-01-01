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
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    //create dictionary with all movies. Will be populated in the sender class
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        titleLabel.text = movie?.title
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie?.overview
        synopsisLabel.sizeToFit() //Prevents the text from getting cut-off with ...
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"

        if let posterPath = movie?.poster_path,
           let posterUrl = URL(string: baseUrl + posterPath)
        {
            posterView.af.setImage(withURL: posterUrl)
        }
        
        // place image in the backdrop
        if let backdropPath = movie?.backdrop_path,
           let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        {
            backdropView.af.setImage(withURL: backdropURL)
        }
        // customize trailer button
        trailerButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 8, bottom: 20, right: 8)  //Adds margins around content (title)
        trailerButton.layer.cornerRadius = 5
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
