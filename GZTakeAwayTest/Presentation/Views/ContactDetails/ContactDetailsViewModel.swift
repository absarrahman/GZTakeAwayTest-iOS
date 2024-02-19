//
//  ContactDetailsViewModel.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import Foundation

class ContactDetailsViewModel {
    
    let fullName: String?
    let email: String?
    let phoneNumber: String?
    let imageUrl: String?
    
    
    init(_ contactModel: ContactModel) {
        fullName = contactModel.fullName
        email = contactModel.email
        phoneNumber = contactModel.phoneNumber?.formatPhoneNumber
        imageUrl = contactModel.image
    }
}
