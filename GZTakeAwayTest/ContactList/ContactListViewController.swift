//
//  ViewController.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit
import Combine

class ContactListViewController: UIViewController {
    
    let viewModel = ContactListViewModel()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var subscriptions: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: ContactTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContactTableViewCell.identifier)
        
        tableView.register(UINib(nibName: ShimmerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ShimmerTableViewCell.identifier)
        
        
        viewModel.$loadingState.sink { [weak self] loadingState in
            guard let self = self else { return }
            if loadingState == .finished {
                tableView.reloadData()
            }
        }.store(in: &subscriptions)
        
        viewModel.fetchData()
    }


}

// MARK: - UITableViewDataSource
extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.loadingState != .finished ? 10 : viewModel.contactModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if viewModel.loadingState != .finished {
            let cell = tableView.dequeueReusableCell(withIdentifier: ShimmerTableViewCell.identifier, for: indexPath) as! ShimmerTableViewCell
            cell.startAnimating()
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as! ContactTableViewCell
            let model = viewModel.contactModels[indexPath.row]
            // TODO: REFACTOR PLZ
            cell.nameLabel.text = model.fullName
            cell.phoneNumberLabel.text = model.phoneNumber
            
            return cell
        }
    }
    
    
}
