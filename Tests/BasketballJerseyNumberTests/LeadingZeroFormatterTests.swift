import XCTest
@testable import BasketballJerseyNumber

final class LeadingZeroFormatterTests: XCTestCase {
    func testRemovesLeadingZeroFrom1To9Range() {
        let testNumbers = [Int](1...9)
        
        testNumbers.forEach { (testNumber) in
            let numberWithLeadingZero = "0\(testNumber)"
            XCTAssertEqual(LeadingZeroFormatter.removeLeadingZero(in: numberWithLeadingZero, highestIncluded: 9), "\(testNumber)")
        }
    }
    
    func testPassesValueIfUpperBoundNotCorrect() {
        let incorrectUpperBounds = [Int](10...100)
        
        incorrectUpperBounds.forEach { (incorrectUpperBound) in
            XCTAssertEqual(LeadingZeroFormatter.removeLeadingZero(in: "01", highestIncluded: incorrectUpperBound), "01")
        }
    }
    
    func testPassesAlongOtherValuesThanLeadingZero() {
        var testValues = [
            "0", "00"
        ]
        
        testValues += [Int](1...99).map({ String($0) })
        testValues += ["abc", "lorem ipsum"]
        testValues += ["😄", "🧔🏻"]
        
        testValues.forEach { (testValue) in
            XCTAssertEqual(LeadingZeroFormatter.removeLeadingZero(in: testValue, highestIncluded: 9), testValue)
        }
    }
}
