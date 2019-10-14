//
//  CoordinatorTests.swift
//  CoordinatorTests
//
//  Created by Mathis Detourbet on 14/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import XCTest
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

class CoordinatorTest: XCTestCase {
    
    var rootCoordinator: FakeCoordinator!

    override func setUp() {
        rootCoordinator = FakeCoordinator(controller: UIViewController())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ParentCoordinatorDelegate_Should_Be_Nil_When_Instantiate() {
        XCTAssertNil(rootCoordinator.parentCoordinatorDelegate, "When a coordinator is instantiated his parentCoordinatorDelegate should be nil")
    }
    
    //MARK: - TEST Present coordinator
    
    func test_PresentCoordinator_Should_Add_ChildCoordinator() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        rootCoordinator.present(coordinator: childCoordinator, animated: false, completion: nil)
        XCTAssertTrue(rootCoordinator.components.childCoordinators.count == 1, "Presenting coordinator should add only one child coordionator")
    }
    
    func test_PresentCoordinator_Should_Start_ChildCoordinator() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        rootCoordinator.present(coordinator: childCoordinator, animated: false, completion: nil)
        XCTAssertTrue(childCoordinator.didCallStart, "Presenting coordinator should call child coordinator start function")
    }
    
    func test_PresentCoordinator_Should_Set_ParentCoordinatorDelegate() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        rootCoordinator.present(coordinator: childCoordinator, animated: false, completion: nil)
        XCTAssertNotNil(childCoordinator.parentCoordinatorDelegate, "ParentCoordinatorDelegate of child coordinator should not be nil")
    }
    
    //MARK: - TEST Dismiss coordinator
    
    func test_DismissCoordinator_Should_Remove_ChildCoordinator() {
        let childCoordinator = FakeCoordinator(controller: UIViewController())
        let secondChildCoordinator = FakeCoordinator(controller: UIViewController())
        let childrenCount = 2
        rootCoordinator.present(coordinator: childCoordinator, animated: false, completion: nil)
        rootCoordinator.present(coordinator: secondChildCoordinator, animated: false, completion: nil)
        XCTAssertTrue(rootCoordinator.components.childCoordinators.count == childrenCount, "Root coordinator should have 2 child coordinators because we just called present coordinator func 2 times")
        
        rootCoordinator.dismiss(coordinator: childCoordinator, animated: false, completion: nil)
        XCTAssertTrue(rootCoordinator.components.childCoordinators.count == childrenCount-1, "Dismissing coordinator should decrease the number of child coordinator")
        XCTAssertFalse(rootCoordinator.components.childCoordinators.contains(where: { ($0 as! FakeCoordinator) === childCoordinator}), "Dismissing coordinator should remove the right coordinator")
    }
}

