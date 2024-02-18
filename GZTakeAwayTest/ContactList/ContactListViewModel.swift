//
//  ContactListViewModel.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import Foundation
import Combine
import Alamofire

enum LoadingState {
    case none
    case started
    case finished
}

class ContactListViewModel {
    
    var contactModels: [Result] = []
    @Published var loadingState: LoadingState = .none
    
    func fetchData() {
        loadingState = .started
        
        // TODO: NEEDS REFACTOR
        AF.request(Secret.baseUrl).response { response in
            
            DispatchQueue.main.async {[weak self] in
                
                guard let self = self else { return }
                
                switch response.result {
                case .success(let data):
                    guard let data = data else { return }
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    do {
                        let results = try decoder.decode(ContactsModel.self, from: data)
                        contactModels = results.result ?? []
                    } catch {
                        print("ERROR OCCURRED \(error)")
                    }
                    loadingState = .finished
                case .failure(let failure):
                    loadingState = .none
                    // if sessionTaskError
                    // it failed to communicate with the server
                    print("FAILURE is \(failure.localizedDescription)")
                }
            }
        }
    }
}
