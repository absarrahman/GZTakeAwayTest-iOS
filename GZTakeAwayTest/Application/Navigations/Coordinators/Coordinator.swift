//
//  Coordinator.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import UIKit

/// A protocol which needs to be conformed in order to make coordinator
protocol Coordinator: AnyObject {
    /// Holds child coordinator
    var childCoordinators: [Coordinator] {get set}
    /// Keeps the reference of the navigation controller
    var navigationController: UINavigationController {get set}
    
    /// Starts the coordinator
    func start()
}
