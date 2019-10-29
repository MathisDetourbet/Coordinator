//
//  SettingsCoordinator.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 29/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

class SettingsCoordinator: NavCoordinator, SettingsRouting {
    
    override func start() {
        if let settingsViewController = StoryboardHelper.instantiateViewController(withIdentifier: "idSettingsViewController") as? SettingsViewController{
            settingsViewController.routingDelegate = self
            setInitialViewController(settingsViewController)
        }
    }
}
