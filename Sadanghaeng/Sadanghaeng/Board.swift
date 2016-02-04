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

    // MARK: Initialization
    
    init?(name: String, nickname: String) {
        // Initialize stored properties.
        self.name = name
        self.nickname = nickname
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }

}