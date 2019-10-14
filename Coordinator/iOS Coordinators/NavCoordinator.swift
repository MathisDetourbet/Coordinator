//
//  NavCoordinator.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 26/01/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import UIKit

class NavCoordinator: Coordinator, ModalPresenter, NavigationPresenter {
    
    let components: CoordinatorComponents<UINavigationController>
    weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    
    required init(controller: UINavigationController) {
        self.components = CoordinatorComponents<UINavigationController>(controller: controller)
    }
    
    func start() {
        fatalError("start method must be overrided in you coordinator class.")
    }
}
