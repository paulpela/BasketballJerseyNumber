public struct FIBAJerseyNumber: Equatable, BasketballJerseyNumber {
    public let number: String
    
    public init?(number: String) {
        let leadingZeros = [Int](1...9).map({ "0\($0)"})
        var convertedNumber: String
        
        if leadingZeros.contains(number) {
            convertedNumber = "\(Int(number)!)"
        } else {
            convertedNumber = number
        }
        
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
