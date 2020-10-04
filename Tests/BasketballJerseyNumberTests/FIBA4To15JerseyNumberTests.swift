import XCTest
@testable import BasketballJerseyNumber

final class FIBA4To15JerseyNumberTests: XCTestCase {
    func testWorksForNumbers4To15() {
        let testNumbers = {
            return [Int](4...15).map({ String($0)} )
        }()
        
        testNumbers.forEach { (number) in
            XCTAssertNotNil(FIBA4To15JerseyNumber(number: number))
        }
    }
    
    func testFailsForEmptyString() {
        XCTAssertNil(FIBA4To15JerseyNumber(number: ""))
    }
    
    func testFailsForStringsLongerThan2() {
        XCTAssertNil(FIBA4To15JerseyNumber(number: "123"))
        XCTAssertNil(FIBA4To15JerseyNumber(number: "1234"))
        XCTAssertNil(FIBA4To15JerseyNumber(number: "123456"))
    }
    
    func testFailsForNonNumericStrings() {
        XCTAssertNil(FIBA4To15JerseyNumber(number: "a"))
        XCTAssertNil(FIBA4To15JerseyNumber(number: "😄"))
        XCTAssertNil(FIBA4To15JerseyNumber(number: "ዉ"))
        XCTAssertNil(FIBA4To15JerseyNumber(number: "⍵"))
    }
    
    func testFailsForNegativeNumbers() {
        for number in (-9)...(-1) {
            XCTAssertNil(FIBA4To15JerseyNumber(number: String(number)))
        }
    }
    
    func testConvertsLeadingZeroToSingleDigit() {
        let testNumbers = [Int](4...9).map({ "0\($0)" })
        
        testNumbers.forEach { (testNumber) in
            let convertedNumber = "\(Int(testNumber)!)"
            XCTAssertEqual(FIBA4To15JerseyNumber(number: testNumber)?.number, convertedNumber)
        }
    }
    
    func testFailsFor0To3() {
        let testNumbers = [Int](0...3).map({ String($0) })
        
        testNumbers.forEach { (testNumber) in
            XCTAssertNil(FIBA4To15JerseyNumber(number: testNumber))
        }
    }
    
    func testStoresAndCanAccessNumber() {
        let testNumbers = [Int](4...15).map({ String($0) })
        
        testNumbers.forEach { (testNumber) in
            XCTAssertTrue(FIBA4To15JerseyNumber(number: testNumber)?.number == testNumber)
        }
    }
    
    func testIsCustomStringConvertible() {
        let testNumbers = [Int](4...15).map({ String($0) })
        
        testNumbers.forEach { (testNumber) in
            XCTAssertEqual("\(FIBA4To15JerseyNumber(number: testNumber)!)", testNumber)
        }
    }
    
    func testIsEquatable() {
        XCTAssertTrue(
            FIBA4To15JerseyNumber(number: "4") == FIBA4To15JerseyNumber(number: "4")
        )
        
        XCTAssertTrue(
            FIBA4To15JerseyNumber(number: "6") != FIBA4To15JerseyNumber(number: "8")
        )
    }
    
    func testComparable5SmallerThan10() {
        XCTAssertTrue(FIBA4To15JerseyNumber(number: "5")! < FIBA4To15JerseyNumber(number: "10")!)
        XCTAssertTrue(FIBA4To15JerseyNumber(number: "6")! < FIBA4To15JerseyNumber(number: "10")!)
        XCTAssertTrue(FIBA4To15JerseyNumber(number: "7")! < FIBA4To15JerseyNumber(number: "10")!)
        XCTAssertTrue(FIBA4To15JerseyNumber(number: "10")! > FIBA4To15JerseyNumber(number: "6")!)
        XCTAssertTrue(FIBA4To15JerseyNumber(number: "14")! < FIBA4To15JerseyNumber(number: "15")!)
    }
}
