//
//  Meal.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 5/26/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
//

import UIKit

class Board {
    // MARK: Properties
    
    var name: String
    var nickname: String
    var date : String
    var viewCount : String
    var like : String
    var dislike : String

    // MARK: Initialization
    
    init?(name: String, nickname: String, date: String, viewCount: String, like:String, dislike:String) {
        // Initialize stored properties.
        self.name = name
        self.nickname = nickname
        self.date = date
        self.viewCount = viewCount
        self.like = like
        self.dislike = dislike
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }

}