import XCTest
@testable import BasketballJerseyNumber

final class NCAAJerseyNumberTests: XCTestCase {
    func testFailsForEmptyString() {
        XCTAssertNil(NCAAJerseyNumber(number: ""))
    }
    
    func testFailsForStringsLongerThan2() {
        XCTAssertNil(NCAAJerseyNumber(number: "123"))
        XCTAssertNil(NCAAJerseyNumber(number: "1234"))
        XCTAssertNil(NCAAJerseyNumber(number: "123456"))
    }
    
    func testFailsForNonNumericStrings() {
        XCTAssertNil(NCAAJerseyNumber(number: "a"))
        XCTAssertNil(NCAAJerseyNumber(number: "😄"))
        XCTAssertNil(NCAAJerseyNumber(number: "ዉ"))
        XCTAssertNil(NCAAJerseyNumber(number: "⍵"))
    }
    
    func testFailsForNegativeNumbers() {
        for number in (-9)...(-1) {
            XCTAssertNil(NCAAJerseyNumber(number: String(number)))
        }
    }
    
    func testCreatesForValidNumbers() {
        let validNumbers: [String] = {
            var valid = ["0", "00"]
            
            valid += [Int](1...5).map({ String($0) })
            valid += [Int](10...15).map({ String($0) })
            valid += [Int](20...25).map({ String($0) })
            valid += [Int](30...35).map({ String($0) })
            valid += [Int](40...45).map({ String($0) })
            valid += [Int](50...55).map({ String($0) })
            
            return valid
        }()
        
        for number in validNumbers {
            XCTAssertNotNil(NCAAJerseyNumber(number: number))
        }
    }
    
    func testConvertsLeadingZeroToSingleDigit() {
        let testNumbers = [Int](1...5).map({ "0\($0)" })
        
        testNumbers.forEach { (testNumber) in
            let convertedNumber = "\(Int(testNumber)!)"
            XCTAssertEqual(NCAAJerseyNumber(number: testNumber)?.number, convertedNumber)
        }
    }
    
    func testStoresAndCanAccessNumber() {
        XCTAssertTrue(NCAAJerseyNumber(number: "0")?.number == "0")
    }
    
    func testIsCustomStringConvertible() {
        XCTAssertEqual("\(NCAAJerseyNumber(number: "0")!)", "0")
        XCTAssertEqual("\(NCAAJerseyNumber(number: "00")!)", "00")
        XCTAssertEqual("\(NCAAJerseyNumber(number: "5")!)", "5")
        XCTAssertEqual("\(NCAAJerseyNumber(number: "10")!)", "10")
    }
    
    func testIsEquatable() {
        XCTAssertTrue(
            NCAAJerseyNumber(number: "0") == NCAAJerseyNumber(number: "0")
        )
        
        XCTAssertTrue(
            NCAAJerseyNumber(number: "0") != NCAAJerseyNumber(number: "00")
        )
        
        XCTAssertTrue(
            NCAAJerseyNumber(number: "5") != NCAAJerseyNumber(number: "15")
        )
    }
    
    func testComparable0SmallerThan00() {
        XCTAssertTrue(NCAAJerseyNumber(number: "0")! < NCAAJerseyNumber(number: "00")!)
    }
    
    func testComparable0SmallerThan10() {
        XCTAssertTrue(NCAAJerseyNumber(number: "0")! < NCAAJerseyNumber(number: "10")!)
    }
    
    func testComparable00SmallerThan1() {
        XCTAssertTrue(NCAAJerseyNumber(number: "00")! < NCAAJerseyNumber(number: "1")!)
    }
    
    func testComparable00SmallerThan10() {
        XCTAssertTrue(NCAAJerseyNumber(number: "00")! < NCAAJerseyNumber(number: "10")!)
    }
    
    func testComparable5SmallerThan10() {
        XCTAssertTrue(NCAAJerseyNumber(number: "5")! < NCAAJerseyNumber(number: "10")!)
    }
}
