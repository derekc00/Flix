//
//  WebServices.swift
//  Flix
//
//  Created by Derek Chang on 7/7/22.
//  Copyright © 2022 Derek Chang. All rights reserved.
//

import Foundation

class WebServices {
    static func loadMovies(completionHandler: @escaping ([Track]?, Error?) -> Void) {
        Network.loadJSONFile(from: "Jack_Johnson_iTunes", type: MusicResults.self) { tracks, error in
            guard error == nil else {
              completionHandler(nil, error)
              return
            }
            completionHandler(tracks?.results, nil)
        }
    }
}
