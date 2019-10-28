//
//  NavCoordinator.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 26/01/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import UIKit

open class NavCoordinator: Coordinator, ModalPresenter, NavigationPresenter {
    
    public let components: CoordinatorComponents<UINavigationController>
    public weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    
    required public init(controller: UINavigationController) {
        self.components = CoordinatorComponents<UINavigationController>(controller: controller)
    }
    
    open func start() {
        fatalError("start method must be overrided in you coordinator class.")
    }
}
