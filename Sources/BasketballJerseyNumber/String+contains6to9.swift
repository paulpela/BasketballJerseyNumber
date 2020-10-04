//
//  File.swift
//  
//
//  Created by Paweł Pela on 04/10/2020.
//

import Foundation

extension String {
    var contains6to9: Bool {
        return self.contains("6") ||
            self.contains("7") ||
            self.contains("8") ||
            self.contains("9")
    }
}
