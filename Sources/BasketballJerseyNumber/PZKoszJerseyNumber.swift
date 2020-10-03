public struct PZKoszJerseyNumber: Equatable, BasketballJerseyNumber {
    public let number: String
    
    static let legalNumbers = {
        return ["00"] + [Int](0...99).map({ String($0) })
    }()
    
    public init?(number: String) {
        let leadingZeros = [Int](1...9).map({ "0\($0)"})
        var convertedNumber: String
        
        if leadingZeros.contains(number) {
            convertedNumber = "\(Int(number)!)"
        } else {
            convertedNumber = number
        }
        
        guard PZKoszJerseyNumber.legalNumbers.contains(convertedNumber) else { return nil }
        
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
