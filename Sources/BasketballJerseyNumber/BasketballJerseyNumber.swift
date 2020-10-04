//
//  File.swift
//  
//
//  Created by Paweł Pela on 04/10/2020.
//

import Foundation

public struct BasketballJerseyNumber: JerseyNumber, Hashable {
    public let number: String
    
    public init?(number: String) {
        self.init(number: number, validationRules: [])
    }
    
    public init?(number: String, validationRules: Set<JerseyNumberValidationRule>) {
        guard number.count < 3 else { return nil }
        guard !number.hasPrefix("-") else { return nil }
        
        if validationRules.contains(.only0to5) && number.contains6to9 { return nil }
        
        if validationRules.contains(.doubleZeroNotAllowed) && number == "00" { return nil }
        
        if validationRules.contains(.noLeadingZeros) && number.count == 2 && number.hasPrefix("0") { return nil }
        
        self.number = number
    }
    
    
}
