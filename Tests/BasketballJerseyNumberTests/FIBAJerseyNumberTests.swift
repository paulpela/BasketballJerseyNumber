import XCTest
@testable import BasketballJerseyNumber

final class FIBAJerseyNumberTests: XCTestCase {
    func testWorksForNumbers0To99And00() {
        let testNumbers = {
            return ["00"] + [Int](0...99).map({ String($0)} )
        }()
        
        testNumbers.forEach { (number) in
            XCTAssertNotNil(FIBAJerseyNumber(number: number))
        }
    }
    
    func testFailsForEmptyString() {
        XCTAssertNil(FIBAJerseyNumber(number: ""))
    }
    
    func testFailsForStringsLongerThan2() {
        XCTAssertNil(FIBAJerseyNumber(number: "123"))
        XCTAssertNil(FIBAJerseyNumber(number: "1234"))
        XCTAssertNil(FIBAJerseyNumber(number: "123456"))
    }
    
    func testFailsForNonNumericStrings() {
        XCTAssertNil(FIBAJerseyNumber(number: "a"))
        XCTAssertNil(FIBAJerseyNumber(number: "😄"))
        XCTAssertNil(FIBAJerseyNumber(number: "ዉ"))
        XCTAssertNil(FIBAJerseyNumber(number: "⍵"))
    }
    
    func testFailsForNegativeNumbers() {
        for number in (-9)...(-1) {
            XCTAssertNil(FIBAJerseyNumber(number: String(number)))
        }
    }
    
    func testStoresAndCanAccessNumber() {
        XCTAssertTrue(FIBAJerseyNumber(number: "0")?.number == "0")
    }
    
    func testIsCustomStringConvertible() {
        XCTAssertEqual("\(FIBAJerseyNumber(number: "0")!)", "0")
        XCTAssertEqual("\(FIBAJerseyNumber(number: "00")!)", "00")
        XCTAssertEqual("\(FIBAJerseyNumber(number: "7")!)", "7")
        XCTAssertEqual("\(FIBAJerseyNumber(number: "10")!)", "10")
    }
    
    func testIsEquatable() {
        XCTAssertTrue(
            FIBAJerseyNumber(number: "0") == FIBAJerseyNumber(number: "0")
        )
        
        XCTAssertTrue(
            FIBAJerseyNumber(number: "0") != FIBAJerseyNumber(number: "00")
        )
    }
    
    func testComparable0SmallerThan00() {
        XCTAssertTrue(FIBAJerseyNumber(number: "0")! < FIBAJerseyNumber(number: "00")!)
    }
    
    func testComparable0SmallerThan10() {
        XCTAssertTrue(FIBAJerseyNumber(number: "0")! < FIBAJerseyNumber(number: "10")!)
    }
    
    func testComparable00SmallerThan1() {
        XCTAssertTrue(FIBAJerseyNumber(number: "00")! < FIBAJerseyNumber(number: "1")!)
    }
    
    func testComparable00SmallerThan10() {
        XCTAssertTrue(FIBAJerseyNumber(number: "00")! < FIBAJerseyNumber(number: "10")!)
    }
    
    func testComparable5SmallerThan10() {
        XCTAssertTrue(FIBAJerseyNumber(number: "5")! < FIBAJerseyNumber(number: "10")!)
    }
}
