import XCTest
@testable import BasketballJerseyNumber

final class PZKoszJerseyNumberTests: XCTestCase {
    func testConformsToBasketballJerseyNumber() {
        let numbers: [BasketballJerseyNumber] = [
            PZKoszJerseyNumber(number: "0")!
        ]
        
        XCTAssertTrue(numbers.count == 1)
        XCTAssertTrue(numbers.first!.number == "0")
    }
    
    func testValueIs0For0() {
        let jerseyNumber = PZKoszJerseyNumber(number: "0")
        XCTAssertEqual(jerseyNumber?.number, "0")
    }
    
    func testValueIs00For00() {
        let jerseyNumber = PZKoszJerseyNumber(number: "00")
        XCTAssertEqual(jerseyNumber?.number, "00")
    }
    
    func testValueIsCorrectFor1To99() {
        for number in 1...99 {
            let jerseyNumber = PZKoszJerseyNumber(number: String(number))
            XCTAssertEqual(jerseyNumber?.number, String(number))
        }
    }
    
    func testInitFailsForNegativeValues() {
        for number in -1000...(-1) {
            let jerseyNumber = PZKoszJerseyNumber(number: String(number))
            XCTAssertNil(jerseyNumber)
        }
    }
    
    func testInitFailsForNumbersAbove99() {
        for number in 100...1000 {
            let jerseyNumber = PZKoszJerseyNumber(number: String(number))
            XCTAssertNil(jerseyNumber)
        }
        
        for number in 2000...5000 {
            let jerseyNumber = PZKoszJerseyNumber(number: String(number))
            XCTAssertNil(jerseyNumber)
        }
    }
    
    func testIsCustomStringConvertible() {
        XCTAssertTrue(PZKoszJerseyNumber(number: "0")?.description == "0")
    }
    
    func testIsHashable() {
        let jerseyNumber1a = PZKoszJerseyNumber(number: "1")
        let jerseyNumber1b = PZKoszJerseyNumber(number: "1")
        
        XCTAssertTrue(jerseyNumber1a == jerseyNumber1b)
    }
    
    func testIsEquatable() {
        let jerseyNumber1 = PZKoszJerseyNumber(number: "1")
        let jerseyNumber2 = PZKoszJerseyNumber(number: "2")
        
        XCTAssertTrue(jerseyNumber1 != jerseyNumber2)
    }
    
    func test0And00AreNotEqual() {
        let jerseyNumber0 = PZKoszJerseyNumber(number: "0")
        let jerseyNumber00 = PZKoszJerseyNumber(number: "00")
        
        XCTAssertTrue(jerseyNumber0 != jerseyNumber00)
    }
}
