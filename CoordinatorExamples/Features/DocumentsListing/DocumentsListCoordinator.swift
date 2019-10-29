//
//  DocumentsListCoordinator.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 29/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

class DocumentsListCoordinator: NavCoordinator, DocumentsListRouting {
    
    override func start() {
        if let documentsViewController = StoryboardHelper.instantiateViewController(withIdentifier: "idDocumentsListViewController") as? DocumentsListViewController {
            documentsViewController.routingDelegate = self
            setInitialViewController(documentsViewController)
        }
    }
}
