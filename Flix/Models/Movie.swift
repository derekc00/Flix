//
//  MovieModel.swift
//  Flix
//
//  Created by Derek Chang on 12/31/20.
//  Copyright © 2020 Derek Chang. All rights reserved.
//

import Foundation

struct Movie: CustomStringConvertible, Decodable {
    
    var title: String
    var overview: String
    var id: UInt
    var poster_path: String
    var backdrop_path: String
    var description: String {
        return """
        Movie: \(title)
        Overview: \(overview)
        id: \(id)
        """
    }
    
    // Decodable allows to parse JSON data into structs/classes
    
    // NOTE: No initializer needed for structs. Memberwise initializer provided.
    // see here: https://www.hackingwithswift.com/quick-start/understanding-swift/how-do-swifts-memberwise-initializers-work
    
    // NOTE: class vs. structs for Movie object?
    // apple docs recommend structs here
    // see here: https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes
    
}

struct MovieResults: Decodable {
    var results: [Movie]
}

// NOTE: `codingKey` is not needed
// see here: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

//extension MovieResults: Decodable {
//    enum CodingKey: String {
//        case results
//    }
//}
