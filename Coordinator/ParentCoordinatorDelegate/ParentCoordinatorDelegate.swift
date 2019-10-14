//
//  ParentCoordinatorDelegate.swift
//  CoordinatorTest
//
//  Created by Mathis Detourbet on 04/02/2018.
//  Copyright © 2018 Mathis Detourbet. All rights reserved.
//

import Foundation

protocol ParentCoordinatorDelegate: class {
    
    func finished<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?)
}

extension ParentCoordinatorDelegate where Self: Coordinator {
    
    func finished<T: Coordinator>(coordinator: T, animated: Bool, completion: (() -> Void)?) {
        dismiss(coordinator: coordinator, animated: animated, completion: completion)
    }
}
