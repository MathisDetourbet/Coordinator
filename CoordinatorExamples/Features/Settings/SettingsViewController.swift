//
//  SecondViewController.swift
//  CoordinatorExamples
//
//  Created by Mathis Detourbet on 14/10/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import UIKit

protocol SettingsRouting: class {
    
}

class SettingsViewController: UIViewController {
    
    public weak var routingDelegate: SettingsRouting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

