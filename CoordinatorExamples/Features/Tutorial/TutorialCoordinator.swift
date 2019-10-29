//
//  TutorialRouting.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 29/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

class TutorialCoordinator: NavCoordinator, TutorialRouting {
    
    override func start() {
        if let firstViewController = StoryboardHelper.instantiateViewController(withIdentifier: "idTutorialStep1ViewController") as? TutorialStep1ViewController {
            firstViewController.routingDelegate = self
            setInitialViewController(firstViewController)
        }
    }
}

protocol TutorialRouting: class {
    func nextSetp()
    func endTutorial()
}

extension TutorialRouting where Self: NavCoordinator {
    
    func nextSetp() {
        if let nextTutorialViewController = StoryboardHelper.instantiateViewController(withIdentifier: "idTutorialStep2ViewController") as? TutorialStep2ViewController {
            nextTutorialViewController.routingDelegate = self
            pushViewController(nextTutorialViewController, animated: true)
        }
    }
    
    func endTutorial() {
        parentCoordinatorDelegate?.finished(coordinator: self, animated: true, completion: nil)
    }
}
