//
//  Coordinator.swift
//  Coordinator
//
//  Created by Mathis Detourbet on 14/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

protocol Coordinator: ModalPresenter, ParentCoordinatorDelegate {
    
    associatedtype ControllerType: UIViewController
    var components: CoordinatorComponents<ControllerType> { get }
    var parentCoordinatorDelegate: ParentCoordinatorDelegate? { get set }
    
    init(controller: ControllerType)
    func start()
    
    func present<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?)
    func dismiss<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?)
}

extension Coordinator {
    
    func present<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?) {
        components.addChildCoordinator(coordinator)
        
        coordinator.parentCoordinatorDelegate = self
        
        coordinator.start()
        
        let childController = coordinator.components.controller
        components.controller.present(childController, animated: animated, completion: completion)
    }

    func dismiss<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?) {
        guard let index = components.childCoordinators.firstIndex(where: { ($0 as! T) === coordinator }) else {
            return
        }
        components.controller.dismiss(animated: animated, completion: completion)
        components.removeChildCoordinator(at: index)
    }
}
