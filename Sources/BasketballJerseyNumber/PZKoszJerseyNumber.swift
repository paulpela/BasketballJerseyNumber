public struct PZKoszJerseyNumber: Equatable {
    public let number: String
    
    static let legalNumbers = {
        return ["00"] + [Int](0...99).map({ String($0) })
    }()
    
    public init?(number: String) {
        guard PZKoszJerseyNumber.legalNumbers.contains(number) else { return nil }
        
        self.number = number
    }
}

extension PZKoszJerseyNumber: CustomStringConvertible {
    public var description: String { number }
}

