//
//  StoryboardHelper.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 29/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

class StoryboardHelper {
    
    static func instantiateViewController(withIdentifier id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id)
    }
}
