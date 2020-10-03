public struct PZKoszJerseyNumber {
    static let illegalValues = {
        [Int]((-9)...(-1)).map { String($0) }
    }()
    
    public init?(number: String) {
        guard !number.isEmpty else { return nil }
        guard number.count < 3 else { return nil }
        guard Int(number) != nil else { return nil }
        guard !PZKoszJerseyNumber.illegalValues.contains(number) else { return nil }
    }
}

