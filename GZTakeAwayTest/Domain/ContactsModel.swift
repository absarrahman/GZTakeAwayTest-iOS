//
//  ContactsModel.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import Foundation

// MARK: - ContactsModel
struct ContactsModel: Codable {
    let error: ServerError?
    let result: [ContactModel]?
    let status: Bool?
    
}

// MARK: - ServerError
struct ServerError: Codable {
    let message: String?
    let code: Int?
}

// MARK: - ContactModel
struct ContactModel: Codable {
    let fullName, phoneNumber, email: String?
    let image: String?
}
