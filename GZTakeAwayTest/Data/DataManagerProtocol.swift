//
//  DataManagerProtocol.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

protocol DataManagerProtocol: AnyObject {
    func getAllContacts(completion: @escaping (Result<([ContactModel]?), Error>) -> ())
}
