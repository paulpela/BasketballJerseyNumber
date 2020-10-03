//
//  File.swift
//  
//
//  Created by Paweł Pela on 03/10/2020.
//

import Foundation

protocol JerseyNumberValidator {
    static func isValid(input: String) -> Bool
}

struct NCAARuleNumberValidator: JerseyNumberValidator {
    static let legalNumbers: [String] = {
        var valid = ["0", "00"]
        
        valid += [Int](1...5).map({ String($0) })
        valid += [Int](10...15).map({ String($0) })
        valid += [Int](20...25).map({ String($0) })
        valid += [Int](30...35).map({ String($0) })
        valid += [Int](40...45).map({ String($0) })
        valid += [Int](50...55).map({ String($0) })
        
        return valid
    }()
    
    static func isValid(input: String) -> Bool {
        NCAARuleNumberValidator.legalNumbers.contains(input)
    }
}

struct FIBARuleNumberValidator: JerseyNumberValidator {
    static let legalNumbers = {
        return ["00"] + [Int](0...99).map({ String($0) })
    }()
    
    static func isValid(input: String) -> Bool {
        FIBARuleNumberValidator.legalNumbers.contains(input)
    }
}
