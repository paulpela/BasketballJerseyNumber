//
//  File.swift
//  
//
//  Created by Paweł Pela on 03/10/2020.
//

import Foundation

public struct NCAAJerseyNumber: Equatable, BasketballJerseyNumber {
    public let number: String
    
    public init?(number: String) {
        let leadingZeros = [Int](1...5).map({ "0\($0)"})
        var convertedNumber: String
        
        if leadingZeros.contains(number) {
            convertedNumber = "\(Int(number)!)"
        } else {
            convertedNumber = number
        }
        
        guard NCAARuleNumberValidator.isValid(input: convertedNumber) else { return nil }
        
        self.number = convertedNumber
    }
}

extension NCAAJerseyNumber: CustomStringConvertible {
    public var description: String { number }
}

extension NCAAJerseyNumber: Comparable {
    public static func < (lhs: NCAAJerseyNumber, rhs: NCAAJerseyNumber) -> Bool {
        if lhs.number == "0" && rhs.number == "00" {
            return true
        }
        
        if lhs.number == "00" && rhs.number == "0" {
            return false
        }
        
        return Int(lhs.number)! < Int(rhs.number)!
    }
}
