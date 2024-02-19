//
//  ContactListViewModel.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import Foundation
import Combine


class ContactListViewModel {
    
    var contactModels: [ContactModel] = []
    private var duplicateModels: [ContactModel] = []
    
    @Published var loadingState: LoadingStatus = .none
    
    @Published var error: Error?
    
    let manager: DataManagerProtocol
    
    init(_ manager: DataManagerProtocol) {
        self.manager = manager
    }
    
    func fetchData() {
        loadingState = .started
        
        manager.getAllContacts {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                
                contactModels = data ?? []
                duplicateModels = data ?? []
                loadingState = .finished
                
            case .failure(let error):
                loadingState = .none
                self.error = error
            }
        }
    }
    
    func searchContact(query: String?) {
        guard let query = query else { return }
        loadingState = .started
        if query.isEmpty {
            // if query is empty then it should show all contacts
            contactModels = duplicateModels
        } else {
            // ignore case and diacritic
            let options: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive]
            
            contactModels = duplicateModels.filter({ model in
                let isNameInQuery = (model.fullName ?? "").range(of: query, options: options) != nil
                let isEmailInQuery = (model.email ?? "").range(of: query, options: options) != nil
                let isPhoneNumberInQuery = (model.phoneNumber ?? "").range(of: query, options: options) != nil
                
                return isNameInQuery || isEmailInQuery || isPhoneNumberInQuery
            })
        }
        loadingState = .finished
    }
}
