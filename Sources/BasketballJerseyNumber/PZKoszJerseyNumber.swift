public struct PZKoszJerseyNumber: Equatable {
    public let number: String
    
    public init?(number: String) {
        guard !number.isEmpty else { return nil }
        guard number.count < 3 else { return nil }
        guard Int(number) != nil else { return nil }
        guard ![Int]((-9)...(-1)).map({ String($0) }).contains(number) else { return nil }
        
        self.number = number
    }
}

extension PZKoszJerseyNumber: CustomStringConvertible {
    public var description: String { number }
}

