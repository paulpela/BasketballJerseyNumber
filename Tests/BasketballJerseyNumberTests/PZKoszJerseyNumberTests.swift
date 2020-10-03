import XCTest
@testable import BasketballJerseyNumber

final class PZKoszJerseyNumberTests: XCTestCase {
    func testWorksForNumbers0To99And00() {
        let testNumbers = {
            return ["00"] + [Int](0...99).map({ String($0)} )
        }()
        
        testNumbers.forEach { (number) in
            XCTAssertNotNil(PZKoszJerseyNumber(number: number))
        }
    }
    
    func testFailsForEmptyString() {
        XCTAssertNil(PZKoszJerseyNumber(number: ""))
    }
    
    func testFailsForStringsLongerThan2() {
        XCTAssertNil(PZKoszJerseyNumber(number: "123"))
        XCTAssertNil(PZKoszJerseyNumber(number: "1234"))
        XCTAssertNil(PZKoszJerseyNumber(number: "123456"))
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
    
    func testStoresAndCanAccessNumber() {
        XCTAssertTrue(PZKoszJerseyNumber(number: "0")?.number == "0")
    }
    
    func testIsCustomStringConvertible() {
        XCTAssertEqual("\(PZKoszJerseyNumber(number: "0")!)", "0")
        XCTAssertEqual("\(PZKoszJerseyNumber(number: "00")!)", "00")
        XCTAssertEqual("\(PZKoszJerseyNumber(number: "7")!)", "7")
        XCTAssertEqual("\(PZKoszJerseyNumber(number: "10")!)", "10")
    }
    
    func testIsEquatable() {
        XCTAssertTrue(
            PZKoszJerseyNumber(number: "0") == PZKoszJerseyNumber(number: "0")
        )
        
        XCTAssertTrue(
            PZKoszJerseyNumber(number: "0") != PZKoszJerseyNumber(number: "00")
        )
    }
    
    func testComparable0SmallerThan00() {
        XCTAssertTrue(PZKoszJerseyNumber(number: "0")! < PZKoszJerseyNumber(number: "00")!)
    }
    
    func testComparable0SmallerThan10() {
        XCTAssertTrue(PZKoszJerseyNumber(number: "0")! < PZKoszJerseyNumber(number: "10")!)
    }
    
    func testComparable00SmallerThan10() {
        XCTAssertTrue(PZKoszJerseyNumber(number: "00")! < PZKoszJerseyNumber(number: "10")!)
    }
    
    func testComparable5SmallerThan10() {
        XCTAssertTrue(PZKoszJerseyNumber(number: "5")! < PZKoszJerseyNumber(number: "10")!)
    }
}
