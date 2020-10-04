//
//  File.swift
//  
//
//  Created by Paweł Pela on 04/10/2020.
//

import Foundation

public struct BasketballJerseyNumber: JerseyNumber, Hashable, CustomStringConvertible {
    public let number: String
    
    public var description: String { number }
    
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

extension BasketballJerseyNumber: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        guard let number = BasketballJerseyNumber(number: value) else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Could not decode JerseyNumber: \(value)")
        }
        self = number
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(number)
    }
}
