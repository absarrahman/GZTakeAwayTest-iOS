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
    
    func dismiss() {
        let vc = navigationController.popViewController(animated: true)
        guard let vc = vc else {
            logPrint("Popped vc is empty")
            return
        }
        logPrint("Popping \(String(describing: vc))")
    }
    
    func openUrlBased(on tag: Int) {
        
        var url: URL? = nil
        
        switch tag {
        case 0:
            if let phoneNumber = model.phoneNumber?.noDashedNumber,
                !phoneNumber.isEmpty,
               let callUrl = URL(string: "tel://\(phoneNumber)") {
                url = callUrl
            }
            break
        case 1:
            if let phoneNumber = model.phoneNumber?.noDashedNumber,
               !phoneNumber.isEmpty,
               let smsUrl = URL(string: "sms://\(phoneNumber)") {
                url = smsUrl
            }
            break
        default:
            if let email = model.email, !email.isEmpty,
                let emailUrl = URL(string: "mailto:\(email)") {
                url = emailUrl
            }
            break
        }
        
        if let url = url, UIApplication.shared.canOpenURL(url) {
            // Possible launch
            UIApplication.shared.open(url)
        } else {
            // cannot launch
            logPrint("Cannot launch url. Showing alert")
            showFailedLaunchAlert()
        }
    }
    
    private func showFailedLaunchAlert() {
        let alertController = UIAlertController(title: "Something went wrong", message: "Failed to launch the app.", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Return", style: .cancel)
        alertController.addAction(dismissAction)
        navigationController.present(alertController, animated: true)
    }
    
}
