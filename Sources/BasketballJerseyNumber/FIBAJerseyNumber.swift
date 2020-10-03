public struct FIBAJerseyNumber: Equatable, BasketballJerseyNumber {
    public let number: String
    
    public init?(number: String) {
        let convertedNumber = LeadingZeroFormatter.removeLeadingZero(in: number, highestIncluded: 9)
        
        guard FIBARuleNumberValidator.isValid(input: convertedNumber) else { return nil }
        
        self.number = convertedNumber
    }
}

extension FIBAJerseyNumber: CustomStringConvertible {
    public var description: String { number }
}

extension FIBAJerseyNumber: Comparable {
    public static func < (lhs: FIBAJerseyNumber, rhs: FIBAJerseyNumber) -> Bool {
        if lhs.number == "0" && rhs.number == "00" {
            return true
        }
        
        if lhs.number == "00" && rhs.number == "0" {
            return false
        }
        
        return Int(lhs.number)! < Int(rhs.number)!
    }
}
