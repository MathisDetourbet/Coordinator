//
//  ModalPresenter.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 12/8/19.
//  Copyright © 2019 Mathis Detourbet. All rights reserved.
//

import Foundation
import UIKit

/// A modal presenter can produce two types of controller presentation : present or dismiss. That protocol defines these two behaviors for a Coordinator.
protocol ModalPresenter {
    
    /// Present modally a view controller on top of another controller.
    ///
    /// - Parameters:
    ///     - viewController: The view controller to present.
    ///     - animated: Boolean indicates if the presenting animation will be aninated or not.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    ///
    func presentViewController(_ viewController: UIViewController, animated: Bool, completion: (()-> Void)?)
    
    
    /// Dismiss the view controller that was presented modally by the view controller.
    ///
    /// - Parameters:
    ///     - flag: Boolean indicates if the  animation will be aninated or not.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    ///
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
