public struct PZKoszJerseyNumber: Equatable, BasketballJerseyNumber {
    public let number: String
    
    public init?(number: String) {
        let convertedNumber = LeadingZeroFormatter.removeLeadingZero(in: number, highestIncluded: 9)
        
        guard FIBARuleNumberValidator.isValid(input: convertedNumber) else { return nil }
        
        self.number = convertedNumber
    }
}

extension PZKoszJerseyNumber: CustomStringConvertible {
    public var description: String { number }
}

extension PZKoszJerseyNumber: Comparable {
    public static func < (lhs: PZKoszJerseyNumber, rhs: PZKoszJerseyNumber) -> Bool {
        if lhs.number == "0" && rhs.number == "00" {
            return true
        }
        
        if lhs.number == "00" && rhs.number == "0" {
            return false
        }
        
        return Int(lhs.number)! < Int(rhs.number)!
    }
}
