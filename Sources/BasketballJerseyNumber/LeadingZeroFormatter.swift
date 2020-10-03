//
//  File.swift
//  
//
//  Created by Paweł Pela on 03/10/2020.
//

import Foundation

struct LeadingZeroFormatter {
    static func removeLeadingZero(in input: String, highestIncluded upperBound: Int) -> String {
        guard upperBound >= 1 && upperBound <= 9 else { return input }
        
        let leadingZeros = [Int](1...upperBound).map({ "0\($0)"})

        if leadingZeros.contains(input) {
            return "\(Int(input)!)"
        } else {
            return input
        }
    }
}
