//
//  MainCoordinator.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import UIKit

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
    
    func showAlertError(error: Error) {
        guard let error = error as? NetworkManager.NetworkError else { return  }
        
        let alertController = UIAlertController(title: "Something went wrong", message: "\(error.localizedDescription)", preferredStyle: .alert)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        if error == .failedToContactServer {
            let successAction = UIAlertAction(title: "Open settings", style: .default) {_ in
                
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    // open setting
                    UIApplication.shared.open(url)
                }
            }
            alertController.addAction(successAction)
        }
        alertController.addAction(cancelAction)
        navigationController.present(alertController, animated: true)
    }
}

extension MainCoordinator: UINavigationControllerDelegate  {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromVC) {
            return
        }
        logPrint("Pop detected")
        // popping
        if let detailsVC = fromVC as? ContactDetailsViewController {
            childDidFinish(detailsVC.coordinator)
        }
        
    }
}
