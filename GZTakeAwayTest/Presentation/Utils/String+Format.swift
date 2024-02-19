//
//  String+Format.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import Foundation

extension String {
    var formatPhoneNumber: Self {
        // creates an array of string separated by dash
        let numberArr = self.components(separatedBy: "-")
        ///
        /// If phoneNumber is  270-555-0117 then the numberArr will be [270, 555, 0117]
        ///
        
        // (270) 555-0117
        return "(\(numberArr[0])) \(numberArr[1])-\(numberArr[2])"
    }
    
    var noDashedNumber: Self {
        return self.replacingOccurrences(of: "-", with: "")
    }
}
