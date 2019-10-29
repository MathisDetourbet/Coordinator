//
//  TutorialStep2ViewController.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 29/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

class TutorialStep2ViewController: UIViewController {
    
    public weak var routingDelegate: TutorialRouting?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishTutorialButtonTouched(_ sender: UIButton) {
        routingDelegate?.endTutorial()
    }
}
