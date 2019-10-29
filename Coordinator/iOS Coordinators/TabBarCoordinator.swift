//
//  TabBarCoordinator.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 26/01/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

/// A tab bar coordinator has got the same navigation behaviour as `UITabBarController`. That's why its controller type will be of type `UITabBarController`. Subclass that class if your app is using a tab bar controller.
open class TabBarCoordinator: Coordinator, ModalPresenter, TabBarPresenter {
    
    public let components: CoordinatorComponents<UITabBarController>
    public weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    
    required public init(controller: UITabBarController) {
        self.components = CoordinatorComponents<UITabBarController>(controller: controller)
    }
    
    internal func setupTabCoordinator<T: Coordinator>(_ coordinator: T, completion: (() -> Void)? = nil) {
        var viewControllers = components.controller.viewControllers ?? []
        components.addChildCoordinator(coordinator)
        coordinator.parentCoordinatorDelegate = self
        viewControllers.append(coordinator.components.controller)
        components.controller.setViewControllers(viewControllers, animated: false)
    }
    
    internal func setupTabCoordinators<T: Coordinator>(_ coordinators: [T], completion: (() -> Void)? = nil) {
        for coordinator in coordinators {
            setupTabCoordinator(coordinator)
        }
    }
    
    open func start() {
        fatalError("start method must be overrided in your coordinator subclass.")
    }
}
