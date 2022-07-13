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
            let songsViewController = navigationControllers.first?.viewControllers.first as? HomeViewController,
            let albumsViewController = navigationControllers.last?.viewControllers.first as? GridViewController
        {
            WebServices.loadMovies { (tracks, error) in
                guard error != nil else {
                    songsViewController.tracks = tracks
                    albumsViewController.tracks = tracks
                    
                    // NOTE: Cannot reload data on collectionView/tableview property
                    // here bc they have not been loaded into memory
                    return
                }
            }
        }
        return true
    }
}

