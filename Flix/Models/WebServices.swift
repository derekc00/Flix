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
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)"
        Network.loadJSONFile(from: url, type: MovieResults.self) { movies, error in
            guard error == nil else {
              completionHandler(nil, error)
              return
            }
            completionHandler(movies!.results, nil)
        }
    }
}
