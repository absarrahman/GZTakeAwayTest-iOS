//
//  String+Format.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import Foundation

extension String {
    /// Returns a formatted phone number from the given string 
    /// 
    /// The following example shows this behavior:
    ///```swift
    ///let number = "270-555-0117"
    ///let formattedNumber = number.formatPhoneNumber
    ///// (270) 555-0117
    ///```
    ///
    ///
    /// - Returns: A formatted phone number from the string containing
    ///  hyphen
    var formatPhoneNumber: Self {
        // creates an array of string separated by dash
        //If phoneNumber is  270-555-0117 then the numberArr will be [270, 555, 0117]
        let numberArr = self.components(separatedBy: "-")
        
        // (270) 555-0117
        return "(\(numberArr[0])) \(numberArr[1])-\(numberArr[2])"
    }
    
    /// Return a formatted number without hyphen
    ///
    /// The following example shows this behavior:
    /// ```swift
    /// let number = "270-555-0117"
    /// let filteredNumber = number.noDashedNumber
    /// // 2705550117
    /// ```
    ///
    /// - Returns: A formatted phone number from the string without hyphen
    ///  hyphen
    var noDashedNumber: Self {
        return self.replacingOccurrences(of: "-", with: "")
    }
}
