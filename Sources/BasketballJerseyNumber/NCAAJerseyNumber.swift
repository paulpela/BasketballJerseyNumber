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
        let convertedNumber = LeadingZeroFormatter.removeLeadingZero(in: number, highestIncluded: 5)
        
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
