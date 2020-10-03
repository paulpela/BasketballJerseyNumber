public struct FIBAJerseyNumber: Equatable, BasketballJerseyNumber {
    public let number: String
    
    static let legalNumbers = {
        return ["00"] + [Int](0...99).map({ String($0) })
    }()
    
    public init?(number: String) {
        guard FIBAJerseyNumber.legalNumbers.contains(number) else { return nil }
        
        self.number = number
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
