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
/// Basically, the coordinator model represents a tree. Each coordinator has a reference to its parent and can have a child as well.
public final class CoordinatorComponents<ControllerType: UIViewController> {
    
    /// The controller used by the Coordinator. It should inherit from UIViewController.
    public let controller: ControllerType
    
    /// An array which represents all children of a coordinator.
    private(set) var childCoordinators: [Any]
    
    /// Init components with a controller inehriting from UIViewController.
    public init(controller: ControllerType) {
        self.controller = controller
        self.childCoordinators = []
    }
    
    /// Adds child coordinator to the stack.
    ///
    /// - Parameter coordinator: the child coordinator to add.
    ///
    internal func addChildCoordinator<T: Coordinator>(_ coordinator: T) {
        childCoordinators.append(coordinator)
    }
    
    /// Removes child coordinator passed in parameter
    ///
    /// - Parameter coordinator: the child coordinator to remove.
    ///
    internal func removeChildCoordinator<T: Coordinator>(_ coordinator: T) {
        guard let index = childCoordinators.firstIndex(where: {
            if let _ = $0 as? T {
                return true
            }
            return false
            
        }) else {
            return
        }
        childCoordinators.remove(at: index)
    }
    
    /// Returns a Boolean value indicating whether the stack contains the child coordinator passed in parameter.
    ///
    /// - Parameter coordinator: the child coordinator to find in the stack.
    /// - Returns: A Boolean of value `true` if the child coordinator is found, `false` otherwise.
    ///
    internal func contains<T: Coordinator>(_ coordinator: T) -> Bool {
        return childCoordinators.contains {
            if let _ = $0 as? T {
                return true
            }
            return false
        }
    }
}
