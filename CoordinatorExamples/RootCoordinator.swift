//
//  RootCoordinator.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 15/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

class RootCoordinator: TabBarCoordinator {
    
    override func start() {
        // Init and set tab coordinators to the tab bar coordinator (here the rootCoordinator).
        let documentsCoordinator = DocumentsListCoordinator(controller: UINavigationController())
        let settingsCoordinator = SettingsCoordinator(controller: UINavigationController())
        
        setupTabCoordinators([documentsCoordinator, settingsCoordinator])
        
        // Start each tab bar coordinator to display view controllers associated.
        documentsCoordinator.start()
        settingsCoordinator.start()
        
        // Start the tutorial if the user has never seen it before.
        startTutorial()
    }
    
    private func startTutorial() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 1000000000)) { [weak self] in
            let tutorialCoordinator = TutorialCoordinator(controller: UINavigationController())
            self?.present(coordinator: tutorialCoordinator, animated: true, completion: nil)
        }
    }
}
