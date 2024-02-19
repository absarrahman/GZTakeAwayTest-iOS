//
//  CommonUtils.swift
//  GZTakeAwayTest
//
//  Created by Moh. Absar Rahman on 19/2/24.
//

import Foundation

func logPrint(
    _ message: String,
    file: String = #file,
    function: String = #function,
    line: Int = #line
) {
    let className = (file as NSString).lastPathComponent
    print("\(message) called from \(function) \(className):\(line)")
}
