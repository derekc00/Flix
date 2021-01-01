//
//  Network.swift
//  Flix
//
//  Created by Derek Chang on 12/31/20.
//  Copyright © 2020 Derek Chang. All rights reserved.
//

import Foundation


class Network {
    static func loadMovies(completionHandler: @escaping ([Movie]?, Bool?) -> Void){
        print("loading movies...")
        var movies: [Movie] = []
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                
                for data in dataDictionary["results"] as! [[String:Any]] {
                    if let title = data["title"] as? String,
                       let overview = data["overview"] as? String,
                       let id = data["id"] as? UInt,
                       let vote_average = data["vote_average"] as? Float,
                       let poster_path = data["poster_path"] as? String,
                       let backdrop_path = data["backdrop_path"] as? String
                    {
                        let movie = Movie(title: title, overview: overview, id: id, vote_average: vote_average, poster_path: poster_path, backdrop_path: backdrop_path)
                        movies.append(movie)
                    }
                    
                }
                completionHandler(movies, true)
                
            }
        }
        task.resume()
        
        
    }
}
