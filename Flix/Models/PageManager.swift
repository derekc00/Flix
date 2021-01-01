//
//  PageManager.swift
//  Flix
//
//  Created by Derek Chang on 1/1/21.
//  Copyright © 2021 Derek Chang. All rights reserved.
//

import Foundation

struct Page {
    var pageNumber: UInt = 1 {
        didSet {
            print("Changed Page Number from \(oldValue) to \(pageNumber)")
        }
        
    }
}
