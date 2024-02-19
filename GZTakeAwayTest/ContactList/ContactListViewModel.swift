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
        
        // TODO: NEEDS REFACTOR
//        AF.request(ApiEndpoint.baseUrl).response { response in
//            
//            DispatchQueue.main.async {[weak self] in
//                
//                guard let self = self else { return }
//                
//                switch response.result {
//                case .success(let data):
//                    guard let data = data else { return }
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    
//                    do {
//                        let results = try decoder.decode(ContactsModel.self, from: data)
//                        contactModels = results.result ?? []
//                    } catch {
//                        print("ERROR OCCURRED \(error)")
//                    }
//                    loadingState = .finished
//                case .failure(let failure):
//                    loadingState = .none
//                    // if sessionTaskError
//                    // it failed to communicate with the server
//                    print("FAILURE is \(failure.localizedDescription)")
//                }
//            }
//        }
    }
}
