//
//  ViewController.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import UIKit
import Combine

class ContactListViewController: UIViewController, MainStoryboarded {
    
    // TODO: - Should be initialized in Coordinator
    var viewModel: ContactListViewModel!
    
    weak var mainCoordinator: MainCoordinator?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var searchFieldView: SearchFieldView!
    
    
    private var subscriptions: Set<AnyCancellable> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        bindData()
        
        viewModel.fetchData()
    }
    
    private func setupViews() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchFieldView.textfield.delegate = self
        
        tableView.register(UINib(nibName: ContactTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContactTableViewCell.identifier)
        
        tableView.register(UINib(nibName: ShimmerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ShimmerTableViewCell.identifier)
        
        searchFieldView.isUserInteractionEnabled = false
    }
    
    private func bindData() {
        viewModel.$loadingState.sink { [weak self] loadingState in
            guard let self = self else { return }
            if loadingState == .finished {
                tableView.reloadData()
                searchFieldView.isUserInteractionEnabled = true
            }
        }.store(in: &subscriptions)
        
        viewModel.$error.sink { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                // tell coordinator to show alert dialog
                mainCoordinator?.showAlertError(viewController: self, error: error)
            }
        }.store(in: &subscriptions)
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
            cell.startLoadingAnimation()
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as! ContactTableViewCell
            let model = viewModel.contactModels[indexPath.row]
            cell.configure(model)
            return cell
        }
    }
    
    
}

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = viewModel.contactModels[indexPath.row]
        
        mainCoordinator?.goToDetails(model)
    }
}

extension ContactListViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.searchContact(query: textField.text)
        tableView.reloadData()
    }
}
