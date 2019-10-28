//
//  NavigationPresenter.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 12/8/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

/// The behavior of navigation between view controllers in iOS is defined by the UINavigationController. The latter gets mainly the push and pop transition. These methods have been implemented to act as a Coordinator. In other words it will call methods
/// from its controller (a UINavigationController) directly.
public protocol NavigationPresenter {
    
    /// Sets the initial view controller of the navigation. That method will add the view controller to the navigation controller stack.
    ///
    /// - Parameters:
    ///     - viewController: The view controller to set as initial view controller.
    ///     - animated: Boolean indicates if the initialization will be aninated or not.
    ///
    func setInitialViewController(_ viewController: UIViewController, animated: Bool)
    
    /// Pushes a view controller onto the receiver’s stack and updates the display.
    ///
    /// - Parameters:
    ///     - viewController: The view controller to push onto the stack. This object cannot be a tab bar controller. If the view controller is already on the navigation stack, this method throws an exception.
    ///     - flag: Boolean indicates if the push animation will be aninated or not.
    ///
    func pushViewController(_ viewController: UIViewController, animated flag: Bool)
    
    /// Pops the top view controller from the navigation stack and updates the display.
    ///
    /// - Parameter flag: Boolean indicates if the pop animation will be aninated or not.
    ///
    func popViewController(animated flag: Bool)
    
    /// Pops all the view controllers on the stack except the root view controller and updates the display.
    ///
    /// - Parameter flag: Boolean indicates if the pop to root view controller animation will be aninated or not.
    ///
    func popToRootViewController(animated flag: Bool)
}

extension NavigationPresenter where Self: NavCoordinator {
    
    public func setInitialViewController(_ viewController: UIViewController, animated: Bool = false) {
        components.controller.setViewControllers([viewController], animated: animated)
    }
    
    public func pushViewController(_ viewController: UIViewController, animated flag: Bool) {
        components.controller.pushViewController(viewController, animated: flag)
    }
    
    public func popViewController(animated flag: Bool) {
        components.controller.popViewController(animated: flag)
    }
    
    public func popToRootViewController(animated flag: Bool) {
        components.controller.popToRootViewController(animated: flag)
    }
}
