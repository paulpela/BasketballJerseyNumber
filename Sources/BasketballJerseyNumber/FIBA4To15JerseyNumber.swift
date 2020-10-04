import Foundation

public struct FIBA4To15JerseyNumber: BasketballJerseyNumber {
    public let number: String
    
    public init?(number: String) {
        let convertedNumber = LeadingZeroFormatter.removeLeadingZero(in: number, highestIncluded: 9)
        guard FIBA4To15RuleNumberValidator.isValid(input: convertedNumber) else { return nil }
        self.number = convertedNumber
    }
}

extension FIBA4To15JerseyNumber: CustomStringConvertible {
    public var description: String { number }
}

extension FIBA4To15JerseyNumber: Comparable {
    public static func < (lhs: FIBA4To15JerseyNumber, rhs: FIBA4To15JerseyNumber) -> Bool {
        return Int(lhs.number)! < Int(rhs.number)!
    }
}
