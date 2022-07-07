//
//  Network.swift
//  Flix
//
//  Created by Derek Chang on 12/31/20.
//  Copyright © 2020 Derek Chang. All rights reserved.
//

import Foundation

class Network {
    
    //
    // MARK: - Class Methods
    //
    static func loadJSONFile<T: Decodable>(from url: String,
                                           type: T.Type,
                                           completionHandler: @escaping (T?, NetworkError?) -> Void) {

        guard let url = URL(string: url) else {
            completionHandler(nil, .invalidUrl)
            return
        }
        let request = URLRequest(url: url)
      
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 200
        
        if statusCode != 200 {
          completionHandler(nil, .requestError)
          return
        }
        
        do {
            if let jsonData = data {
                let decoder = JSONDecoder()
                let typedObject: T? = try decoder.decode(T.self, from: jsonData)
                completionHandler(typedObject, nil)
            }
        } catch {
            print(error)
            completionHandler(nil, .parseError)
        }
      }
      
      dataTask.resume()
    }
  
//    static func loadMovies(completionHandler: @escaping ([Movie]?, Bool?) -> Void){
//        print("loading movies...")
//        var movies: [Movie] = []
//        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
//        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 200
//
//            if statusCode != 200 {
//              completionHandler(nil, .requestError)
//              return
//            }
//
//            do {
//              if let jsonData = data {
//                let decoder = JSONDecoder()
//
//                let typedObject: T? = try decoder.decode(T.self, from: jsonData)
//                completionHandler(typedObject, nil)
//              }
//            } catch {
//              print(error)
//              completionHandler(nil, .parseError)
//            }
          
//            // This will run when the network request returns
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//
//                for data in dataDictionary["results"] as! [[String:Any]] {
//                    if let title = data["title"] as? String,
//                       let overview = data["overview"] as? String,
//                       let id = data["id"] as? UInt,
//                       let poster_path = data["poster_path"] as? String,
//                       let backdrop_path = data["backdrop_path"] as? String
//                    {
//                      let movie = Movie(title: title, overview: overview, id: id, poster_path: poster_path, backdrop_path: backdrop_path)
//                        movies.append(movie)
//                    }
//                }
//                completionHandler(movies, true)
//
//            }
//        task.resume()
//    }
  
}
