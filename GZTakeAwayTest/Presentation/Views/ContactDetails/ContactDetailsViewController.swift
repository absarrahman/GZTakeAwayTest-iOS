//
//  ContactDetailsViewController.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import UIKit
import SDWebImage

class ContactDetailsViewController: UIViewController, MainStoryboarded {
    
    var viewModel: ContactDetailsViewModel!
    
    var coordinator: ContactDetailsCoordinator?

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureFromVM()
        configureBackButton()
        
    }
    
    private func configureBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "BackButton")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // keeping this line in viewDidLoad will not make it circular
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        logPrint("BUTTON TAPPED \(sender.tag)")
        // coordinator should take responsibility for navigation based on tag
    }
    

}

extension ContactDetailsViewController {
    private func configureFromVM() {
        fullNameLabel.text = viewModel.fullName
        emailLabel.text = viewModel.email
        phoneNumberLabel.text = viewModel.phoneNumber
        setImageFromUrl(urlString: viewModel.imageUrl ?? "")
    }
    
    private func setImageFromUrl(urlString: String) {
        userImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil, options: [.progressiveLoad])
    }
    
    @objc private func backButtonTapped() {
        coordinator?.dismiss()
    }
    
}
