//
//  MovieModel.swift
//  Flix
//
//  Created by Derek Chang on 12/31/20.
//  Copyright © 2020 Derek Chang. All rights reserved.
//

import Foundation

struct Movie: CustomStringConvertible, Codable {
    
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
}

struct Movies: Codable {
    var results: [Movie]
    

}
