//
//  MockerFactory.swift
//  CoordinatorTests
//
//  Created by Mathis Detourbet on 14/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit
@testable import Coordinator

class FakeCoordinator: Coordinator {
    var components: CoordinatorComponents<UIViewController>
    var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    typealias ControllerType = UIViewController
    
    private(set) var didCallStart = false
    
    required init(controller: UIViewController) {
        self.components = CoordinatorComponents<UIViewController>(controller: controller)
    }
    
    func start() {
        didCallStart = true
    }
}
