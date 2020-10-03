//
//  File.swift
//  
//
//  Created by Paweł Pela on 03/10/2020.
//

import Foundation

public struct NCAAJerseyNumber: Equatable {
    public let number: String
    
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
    
    public init?(number: String) {
        guard NCAAJerseyNumber.legalNumbers.contains(number) else { return nil }
        
        self.number = number
    }
}

extension NCAAJerseyNumber: CustomStringConvertible {
    public var description: String { number }
}
