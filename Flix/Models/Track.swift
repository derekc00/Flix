//
//  Track.swift
//  Flix
//
//  Created by Derek Chang on 7/13/22.
//  Copyright © 2022 Derek Chang. All rights reserved.
//

import Foundation

struct Track: Decodable {
    var trackId: UInt
    var artistName: String
    var trackName: String
    var previewUrl: String
    var artworkUrl100: String
    var collectionId: UInt
    var collectionName: String
    // Decodable allows to parse JSON data into structs/classes
    
    // NOTE: No initializer needed for structs. Memberwise initializer provided.
    // see here: https://www.hackingwithswift.com/quick-start/understanding-swift/how-do-swifts-memberwise-initializers-work
    
    // NOTE: class vs. structs for Movie object?
    // apple docs recommend structs here
    // see here: https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes
    
}

struct MusicResults: Decodable {
    var results: [Track]
}

// NOTE: `codingKey` is not needed
// see here: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

//extension MovieResults: Decodable {
//    enum CodingKey: String {
//        case results
//    }
//}
