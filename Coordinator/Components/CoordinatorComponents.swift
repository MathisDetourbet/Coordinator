//
//  Components.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 26/01/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

final class CoordinatorComponents<ControllerType: UIViewController> {
    let controller: ControllerType
    var childCoordinators: [Any] = []
    
    init(controller: ControllerType) {
        self.controller = controller
    }
    
    func addChildCoordinator<T: Coordinator>(_ coordinator: T) {
        childCoordinators.append(coordinator)
    }
}
