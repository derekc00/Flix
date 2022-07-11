//
//  WebServices.swift
//  Flix
//
//  Created by Derek Chang on 7/7/22.
//  Copyright © 2022 Derek Chang. All rights reserved.
//

import Foundation

class WebServices {
    static func loadMovies(completionHandler: @escaping ([Movie]?, Error?) -> Void) {
        Network.loadJSONFile(from: "Flix_Now_Playing", type: MovieResults.self) { movies, error in
            guard error == nil else {
              completionHandler(nil, error)
              return
            }
            completionHandler(movies!.results, nil)
        }
    }
}
