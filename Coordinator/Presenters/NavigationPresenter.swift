//
//  NavigationPresenter.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 12/8/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationPresenter {
    
    func setInitialViewController(_ viewController: UIViewController, animated: Bool)
    func pushViewController(_ viewController: UIViewController, animated flag: Bool)
    func popViewController(animated flag: Bool)
    func popToRootViewController(animated flag: Bool)
}

extension NavigationPresenter where Self: NavCoordinator {
    
    func setInitialViewController(_ viewController: UIViewController, animated: Bool = false) {
        components.controller.setViewControllers([viewController], animated: animated)
    }
    
    func pushViewController(_ viewController: UIViewController, animated flag: Bool) {
        components.controller.pushViewController(viewController, animated: flag)
    }
    
    func popViewController(animated flag: Bool) {
        components.controller.popViewController(animated: flag)
    }
    
    func popToRootViewController(animated flag: Bool) {
        components.controller.popToRootViewController(animated: flag)
    }
}
