//
//  Coordinator.swift
//  Coordinator
//
//  Created by Mathis Detourbet on 14/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

public protocol Coordinator: ModalPresenter, ParentCoordinatorDelegate {
    
    associatedtype ControllerType: UIViewController
    var components: CoordinatorComponents<ControllerType> { get }
    var parentCoordinatorDelegate: ParentCoordinatorDelegate? { get set }
    
    init(controller: ControllerType)
    func start()
    
    func present<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?)
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
