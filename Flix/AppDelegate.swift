//
//  AppDelegate.swift
//  Flix
//
//  Created by Derek Chang on 1/12/19.
//  Copyright © 2019 Derek Chang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Needed to load movies on application launch. Calls API to parse and populate data
        if
            let tabBarController = window?.rootViewController as? UITabBarController,
            let navigationControllers = tabBarController.viewControllers as? [UINavigationController],
            let moviesScrollViewController = navigationControllers.first?.viewControllers.first as? MoviesViewController,
            let moviesCollectionViewController = navigationControllers.last?.viewControllers.first as? MovieGridViewController
        {
            WebServices.loadMovies { (movies, error) in
                guard error != nil else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        moviesScrollViewController.movies = movies
                        moviesCollectionViewController.movies = movies
                    }
                    
                    // NOTE: Cannot reload data here bc collectionView/tableview property
                    // has not been loaded into memory here
//                    moviesCollectionViewController.collectionView.reloadData()
//                    moviesScrollViewController.tableView.reloadData()
                    return
                }
            }
        }
        return true
    }
}

