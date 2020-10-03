import XCTest
@testable import BasketballJerseyNumber

final class PZKoszJerseyNumberTests: XCTestCase {
    func testFailsForEmptyString() {
        XCTAssertNil(PZKoszJerseyNumber(number: ""))
    }
    
    func testFailsForStringsLongerThan2() {
        XCTAssertNil(PZKoszJerseyNumber(number: "123"))
    }
    
    func testFailsForNonNumericStrings() {
        XCTAssertNil(PZKoszJerseyNumber(number: "a"))
        XCTAssertNil(PZKoszJerseyNumber(number: "😄"))
        XCTAssertNil(PZKoszJerseyNumber(number: "ዉ"))
        XCTAssertNil(PZKoszJerseyNumber(number: "⍵"))
    }
    
    func testFailsForNegativeNumbers() {
        for number in (-9)...(-1) {
            XCTAssertNil(PZKoszJerseyNumber(number: String(number)))
        }
    }
}
