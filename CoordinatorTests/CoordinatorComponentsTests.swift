//
//  CoordinatorComponentsTests.swift
//  CoordinatorTests
//
//  Created by Mathis Detourbet on 16/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import XCTest
@testable import Coordinator

class CoordinatorComponentsTests: XCTestCase {
    
    private var components: CoordinatorComponents<UIViewController>!

    override func setUp() {
        components = CoordinatorComponents(controller: UIViewController())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_AddChildCoordinator_Should_Append_Child() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        
        XCTAssertTrue(components.childCoordinators.isEmpty)
        
        components.addChildCoordinator(childCoordinator)
        
        XCTAssertFalse(components.childCoordinators.isEmpty)
    }
    
    func test_RemoveChildCoordinator_Should_Remove_Child() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        
        components.addChildCoordinator(childCoordinator)
        components.removeChildCoordinator(childCoordinator)
        
        XCTAssertTrue(components.childCoordinators.isEmpty, "Calling removeChildCoordinator method should remove the")
    }
    
    func test_ContainsCoordinator_Should_Return_True_If_Coordinator_Is_Contained_In_Childs_Array() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        
        XCTAssertFalse(components.contains(childCoordinator))
        
        components.addChildCoordinator(childCoordinator)
        XCTAssertTrue(components.contains(childCoordinator), "Should return true because childCoordinator has been added previously.")
    }

}
