//
//  Network.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import Foundation
import Alamofire

enum LoadingStatus {
    case none
    case started
    case finished
}

class NetworkManager: DataManagerProtocol {
    
    enum NetworkError: Error {
        case noDataError
        case jsonDecodingError
        case failedToContactServer
        
        var localizedDescription: String {
            switch self {
            case .noDataError:
                return NSLocalizedString("No data found", comment: "")
            case .jsonDecodingError:
                return NSLocalizedString("JSON decoding failed", comment: "")
            case .failedToContactServer:
                return NSLocalizedString("Failed to contact server", comment: "")
            }
        }
    }
    
    static let shared = NetworkManager()
    
    
    
    private init() {}
    
    private func fetchDataFromAPI<T: Codable> (
        from endpoint: String,
        using parameters: [String:String] = [:],
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        
        AF.request(endpoint).response { response in
            
            DispatchQueue.main.async {
                
                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        completion(.failure(NetworkError.noDataError))
                        return
                    }
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    do {
                        let results = try decoder.decode(T.self, from: data)
                        completion(.success(results))
                    } catch {
                        print("ERROR OCCURRED \(error)")
                        completion(.failure(NetworkError.jsonDecodingError))
                    }
                case .failure(let error):
                    // it failed to communicate with the server
                    print("FAILURE is \(error.localizedDescription)")
                    completion(.failure(NetworkError.failedToContactServer))
                }
            }
        }
        
    }
    
    func getAllContacts(completion: @escaping (Result<([ContactModel]?), Error>) -> ()) {
        
        let endpoint = ApiEndpoint.baseUrl
        
        fetchDataFromAPI(from: endpoint) { (result: Result<ContactsModel, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data.result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
