//
//  NavCoordinatorTests.swift
//  CoordinatorTests
//
//  Created by Mathis Detourbet on 14/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import XCTest
@testable import Coordinator

class NavCoordinatorTests: XCTestCase {
    
    private var navCoordinator: NavCoordinator!

    override func setUp() {
        navCoordinator = NavCoordinator(controller: UINavigationController())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_SetInitialViewController_Should_Set_ViewController_In_Navigation_Stack() {
        let vc = UIViewController()
        navCoordinator.setInitialViewController(vc)
        XCTAssertFalse(navCoordinator.components.controller.viewControllers.isEmpty)
    }
    
    func test_PushViewController_Should_Append_ViewController_In_Navigation_Stack() {
        let initialVC = UIViewController()
        let pushedVC = UIViewController()
        
        navCoordinator.setInitialViewController(initialVC)
        navCoordinator.pushViewController(pushedVC, animated: false)
        
        XCTAssertTrue(navCoordinator.components.controller.viewControllers.count == 2, "PushViewController should append the vc to the navigation stack")
    }
    
    func test_popViewController_Should_Remove_ViewController_In_Navigation_Stack() {
        let initialVC = UIViewController()
        let pushedVC = UIViewController()
        
        navCoordinator.setInitialViewController(initialVC)
        navCoordinator.pushViewController(pushedVC, animated: false)
        navCoordinator.popViewController(animated: false)
        
        XCTAssertTrue(navCoordinator.components.controller.viewControllers.count == 1, "PopViewController should remove the last vc to the navigation stack")
    }
    
    func test_PopToRootViewController_Should_Remove_All_VC_In_Navigation_Stack() {
        let initialVC = UIViewController()
        let pushedVC = UIViewController()
        let secondPushedVC = UIViewController()
        
        navCoordinator.setInitialViewController(initialVC)
        navCoordinator.pushViewController(pushedVC, animated: false)
        navCoordinator.pushViewController(secondPushedVC, animated: false)
        navCoordinator.popToRootViewController(animated: false)
        
        XCTAssertTrue(navCoordinator.components.controller.viewControllers.count == 1, "PushViewController should append the vc to the navigation stack")
    }

}
