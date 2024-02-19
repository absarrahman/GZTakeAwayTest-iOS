//
//  ContactDetailsCoordinator.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import UIKit

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
