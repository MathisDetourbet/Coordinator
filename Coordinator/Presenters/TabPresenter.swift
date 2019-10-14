//
//  TabPresenter.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 12/8/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

protocol TabPresenter: ModalPresenter {
    
    func setViewControllers(_ viewControllers: [UIViewController], animated flag: Bool)
}

extension TabPresenter where Self: TabBarCoordinator {
    
    func setViewControllers(_ viewControllers: [UIViewController], animated flag: Bool) {
        components.controller.setViewControllers(viewControllers, animated: flag)
    }
}
