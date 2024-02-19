//
//  Coordinator.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ContactListViewController.instantiate()
        navigationController.delegate = self
        vc.mainCoordinator = self
        vc.viewModel = ContactListViewModel(NetworkManager.shared)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToDetails(_ contactModel: ContactModel) {
        let detailsCoordinator = ContactDetailsCoordinator(navigationController: navigationController, model: contactModel)
        
        detailsCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate  {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromVC) {
            return
        }
        // popping
        if let detailsVC = fromVC as? ContactDetailsViewController {
            childDidFinish(detailsVC.coordinator)
        }
        
    }
}

class ContactDetailsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    let model: ContactModel!
    
    init(navigationController: UINavigationController, model: ContactModel) {
        self.navigationController = navigationController
        self.model = model
    }
    
    func start() {
        let vc = ContactDetailsViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = ContactDetailsViewModel(model)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
