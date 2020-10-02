public struct PZKoszJerseyNumber: BasketballJerseyNumber, Hashable {
    public let number: String
    
    static let legalNumbers = {
        return ["00"] + [Int](0...99).map({ (item) -> String in
            String(item)
        })
    }()
    
    init?(number: String) {
        guard PZKoszJerseyNumber.legalNumbers.contains(number) else { return nil }
        self.number = number
    }
}

extension PZKoszJerseyNumber: CustomStringConvertible {
    public var description: String { number }
}
