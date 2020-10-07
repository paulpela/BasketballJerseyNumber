//
//  File.swift
//  
//
//  Created by Paweł Pela on 03/10/2020.
//

import Foundation

public enum JerseyNumberValidationRule {
    case only0to5, doubleZeroNotAllowed, noLeadingZeros
}

public protocol JerseyNumber {
    associatedtype T
    
    var number: String { get }
    
    init?(number: String)
    
    init?(number: String, validationRules: Set<JerseyNumberValidationRule>)
    
    func copy(usingValidationRules rules: Set<JerseyNumberValidationRule>) -> T?
    
    func follows(rules: Set<JerseyNumberValidationRule>) -> Bool
}
