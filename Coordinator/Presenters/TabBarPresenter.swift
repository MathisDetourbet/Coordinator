//
//  TabPresenter.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 12/8/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

/// The behavior of a UITabBarController is mainly the setup of its view controllers. These view controllers represent tabs of the tab bar controller.
public protocol TabBarPresenter: ModalPresenter {
    
    /// Sets the root view controllers of the tab bar controller.
    ///
    /// - Parameters:
    ///     - viewControllers: The array of custom view controllers to display in the tab bar interface. The order of the view controllers in this array corresponds to the display order in the tab bar, with the controller at index 0 representing the
    ///     left-most tab, the controller at index 1 the next tab to the right, and so on.
    ///     - flag: Boolean indicates if the initialization will be aninated or not.
    ///
    func setViewControllers(_ viewControllers: [UIViewController], animated flag: Bool)
}

extension TabBarPresenter where Self: TabBarCoordinator {
    
    public func setViewControllers(_ viewControllers: [UIViewController], animated flag: Bool) {
        components.controller.setViewControllers(viewControllers, animated: flag)
    }
}
