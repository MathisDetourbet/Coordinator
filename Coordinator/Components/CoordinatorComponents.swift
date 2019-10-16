//
//  Components.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 26/01/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

/// This class has been made for gathering coordinator components in a single class to respect encapsulation and for more readability. CoordinatorComponents class can be seen as the coordinator's model.
final class CoordinatorComponents<ControllerType: UIViewController> {
    
    /// The controller used by the Coordinator. It should inherit from UIViewController.
    let controller: ControllerType
    
    /// An array which represents all children of a coordinator.
    private(set) var childCoordinators: [Any]
    
    init(controller: ControllerType) {
        self.controller = controller
        self.childCoordinators = []
    }
    
    func addChildCoordinator<T: Coordinator>(_ coordinator: T) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(at index: Int) {
        guard childCoordinators.startIndex...childCoordinators.endIndex ~= index else {
            return
        }
        childCoordinators.remove(at: index)
    }
}
