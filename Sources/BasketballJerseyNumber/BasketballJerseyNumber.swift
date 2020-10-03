//
//  File.swift
//  
//
//  Created by Paweł Pela on 03/10/2020.
//

import Foundation

public protocol BasketballJerseyNumber {
    var number: String { get }
    
    init?(number: String)
}
