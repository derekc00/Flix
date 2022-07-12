//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Derek Chang on 1/27/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtextLabel: UILabel!
    
    //create optional property for Movie. Will be populated by the origin class's prepare method
    var data: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = data?.title
        titleLabel.sizeToFit() //Prevents the text from getting cut-off with "..."
        
        subtextLabel.text = data?.overview
        subtextLabel.sizeToFit()

        // place image in the backdrop
        if let backdropPath = data?.backdrop_path,
           let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        {
            Nuke.loadImage(with: backdropURL, into: backdropImageView)
        }
        
    }
}
