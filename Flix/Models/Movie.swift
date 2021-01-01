//
//  MovieModel.swift
//  Flix
//
//  Created by Derek Chang on 12/31/20.
//  Copyright © 2020 Derek Chang. All rights reserved.
//

import Foundation

class Movie: CustomStringConvertible, Decodable {
    
    var title: String
    var overview: String
    var id: UInt
    var vote_average: Float
    var poster_path: String
    var backdrop_path: String
    var description: String {
        return """
        Movie: \(title)
        Overview: \(overview)
        id: \(id)
        vote_average: \(vote_average)
        """
    }
    
    init(title: String, overview: String, id: UInt, vote_average: Float, poster_path: String, backdrop_path: String) {
        self.title = title
        self.overview = overview
        self.id = id
        self.vote_average = vote_average
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
    }
    
    //MARK: - instance methods
    
}
