//
//  TutorialViewController.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 29/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

class TutorialStep1ViewController: UIViewController {
    
    public weak var routingDelegate: TutorialRouting?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextSetpButtonTouched(_ sender: UIButton) {
        routingDelegate?.nextSetp()
    }
}
