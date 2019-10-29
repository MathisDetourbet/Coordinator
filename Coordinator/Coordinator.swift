//
//  Coordinator.swift
//  Coordinator
//
//  Created by Mathis Detourbet on 14/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

/// Represents a basic Coordinator interface.
///
/// Basically, a coordinator is in charge of the navigation between view controllers in your app. All your navigation requests will go through the current coordinator which is managing your active view
/// controller. That' why the basic Coordinator has the same navigation behaviours than the `UIViewController` class, in other words: present and dismiss a view controller. In the case you need more navigation behaviour see NavigationCoordinator
/// and TabBarCoordinator.
///
/// A coordinator needs to be started before using it. The main idea of that method is to init view model and view controller and display it.
///
public protocol Coordinator: ModalPresenter, ParentCoordinatorDelegate {
    
    /// Represents the type of the coordinator's controller. Should be at leat inherit from `UIViewController` class.
    associatedtype ControllerType: UIViewController
    
    /// Group of coordinator's components.
    var components: CoordinatorComponents<ControllerType> { get }
    
    /// Refers to its parent. Used to communicate with its parent.
    var parentCoordinatorDelegate: ParentCoordinatorDelegate? { get set }
    
    /// Present modally a view controller on top of another controller.
    ///
    /// - Parameter controller: The view controller to set. It represents the level of navigation of the coordinator. This parameter should inherit from `UIViewController` class.
    ///
    init(controller: ControllerType)
    
    /// Start the coordinator.
    ///
    /// Start method should be called before using the coordinator. Indeed, it used to be called just after its initialization.
    /// Calling that method will tell the coordinator to take over control.
    ///
    func start()
    
    /// Present modally a coordinator.
    ///
    /// Presenting a coordinator means design a new flow in your navigation architecture. Under the hood, presenting a coordinator will firstly add the child coordinator to the current coordinator, then start the child coordinator and finally present the
    /// child coordinator's controller on top of the actual controller.
    ///
    /// - Parameters:
    ///     - coordinator: The child view controller to present.
    ///     - animated: Boolean indicates if the present animation will be aninated or not.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    ///
    func present<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?)
    
    /// Dismiss modally a coordinator.
    ///
    /// - Parameters:
    ///     - coordinator: The child coordinator to dismiss.
    ///     - animated: Boolean indicates if the dismiss animation will be aninated or not.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    ///
    func dismiss<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?)
}

extension Coordinator {
    
    public func present<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?) {
        components.addChildCoordinator(coordinator)
        
        coordinator.parentCoordinatorDelegate = self
        
        coordinator.start()
        
        let childController = coordinator.components.controller
        components.controller.present(childController, animated: animated, completion: completion)
    }

    public func dismiss<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?) {
        guard components.contains(coordinator) else { return }
        
        components.controller.dismiss(animated: animated, completion: completion)
        components.removeChildCoordinator(coordinator)
    }
}
