//
//  TabBarCoordinator.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 26/01/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator, ModalPresenter, TabBarPresenter {
    
    let components: CoordinatorComponents<UITabBarController>
    weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    
    required init(controller: UITabBarController) {
        self.components = CoordinatorComponents<UITabBarController>(controller: controller)
    }
    
    internal func setupTabCoordinator<T: Coordinator>(_ coordinator: T, completion: (() -> Void)? = nil) {
        var viewControllers = components.controller.viewControllers ?? []
        components.addChildCoordinator(coordinator)
        coordinator.parentCoordinatorDelegate = self
        viewControllers.append(coordinator.components.controller)
        components.controller.setViewControllers(viewControllers, animated: false)
    }
    
    func start() {
        fatalError("start method must be overrided in you coordinator class.")
    }
}
