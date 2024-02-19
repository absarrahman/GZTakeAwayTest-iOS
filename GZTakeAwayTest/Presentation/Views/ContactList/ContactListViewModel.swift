//
//  ContactListViewModel.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import Foundation
import Combine
import Alamofire


class ContactListViewModel {
    
    var contactModels: [ContactModel] = []
    @Published var loadingState: LoadingStatus = .none
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
                loadingState = .finished
                
            case .failure(let error):
                // TODO: Capture error to show the user
                loadingState = .none
            }
        }
    }
}
