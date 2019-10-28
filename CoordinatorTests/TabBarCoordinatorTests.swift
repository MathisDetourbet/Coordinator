//
//  TabCoordinatorTests.swift
//  CoordinatorTests
//
//  Created by Mathis Detourbet on 15/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import XCTest
@testable import Coordinator

class TabBarCoordinatorTests: XCTestCase {
    
    private var tabBarCoordinator: TabBarCoordinator!

    override func setUp() {
        tabBarCoordinator = TabBarCoordinator(controller: UITabBarController())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_setupTabCoordinator_Should_Append_ChildCoordinator() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        
        XCTAssertTrue(tabBarCoordinator.components.childCoordinators.isEmpty)
        
        tabBarCoordinator.setupTabCoordinator(childCoordinator)
        
        XCTAssertFalse(tabBarCoordinator.components.childCoordinators.isEmpty, "SetupTabCoordinator should append the tab coordinator as a child.")
    }

}
