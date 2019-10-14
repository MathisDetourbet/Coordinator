//
//  ModalPresenter.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 12/8/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

protocol ModalPresenter {
    
    func presentViewController(_ viewController: UIViewController, animated: Bool, completion: (()-> Void)?)
    
    func dismiss(animated flag: Bool, completion: (()-> Void)?)
}

extension ModalPresenter where Self: Coordinator {
    
    func presentViewController(_ viewController: UIViewController, animated: Bool, completion: (()-> Void)?) {
        components.controller.present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated flag: Bool, completion: (()-> Void)?) {
        components.controller.presentedViewController?.dismiss(animated: flag, completion: completion)
    }
}
