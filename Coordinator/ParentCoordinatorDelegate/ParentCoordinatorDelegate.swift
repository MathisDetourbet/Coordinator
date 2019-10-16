//
//  ParentCoordinatorDelegate.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 04/02/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import Foundation

/// All coordinator except the root view controller needs a parent. That relation between them is used for sharing message like the one describe in that protocol.
protocol ParentCoordinatorDelegate: class {
    
    /// A soon as a coordinator has finished its job and doesn't need to be kept alive, you will need to call that method to notify its parent for being deinit.
    ///
    /// - Parameters:
    ///     - coordinator: The reference of the coordinator who asking for being deinit. In most of the cases, you will pass ‘self‘.
    ///     - animated: Boolean indicates if the presenting animation will be aninated or not.
    ///     - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    ///
    func finished<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?)
}

extension ParentCoordinatorDelegate where Self: Coordinator {
    
    func finished<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?) {
        dismiss(coordinator: coordinator, animated: animated, completion: completion)
    }
}
