//
//  ContactsModel.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 18/2/24.
//

import Foundation

// MARK: - ContactsModel
struct ContactsModel: Codable {
    let error: Error?
    let result: [Result]?
    let status: Bool?
}

// MARK: - Error
struct Error: Codable {
    let message: String?
    let code: Int?
}

// MARK: - Result
struct Result: Codable {
    let fullName, phoneNumber, email: String?
    let image: String?
}
