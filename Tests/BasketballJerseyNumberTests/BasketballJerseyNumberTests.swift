import XCTest
@testable import BasketballJerseyNumber

final class BasketballJerseyNumberTests: XCTestCase {
    let zeroTo99and00 = {
        return ["00"] + [Int](0...99).map({ String($0) })
    }()
    
    let leadingZeros = ["01", "02", "03", "04", "05", "06", "07", "08", "09"]
    
    let noLeadingZerosValidNumbers = {
        return ["00"] + [Int](0...99).map({ String($0) })
    }()
    
    let numbersWith6to9 = [
        "6", "7", "8", "9", "16", "17", "19", "27", "36", "37", "48", "56", "57", "60", "70", "80", "90", "99"
    ]
    
    let numbersWith6to9LeadingZeros = [
        "06", "07", "08", "09"
    ]
    
    func testNumberPropertyIsTheSameAsProvidedInput() {
        zeroTo99and00.forEach { (input) in
            XCTAssertEqual(BasketballJerseyNumber(number: input)!.number, input)
        }
    }
    
    func testAcceptsLeadingZeroValues() {
        leadingZeros.forEach { (input) in
            XCTAssertEqual(BasketballJerseyNumber(number: input)!.number, input)
        }
    }
    
    func testDiscardsInputsLongerThan2() {
        let testInputs = [
            "123", "234", "-12", "000", "abc", "lorem ipsum"
        ]
        
        testInputs.forEach { (input) in
            XCTAssertNil(BasketballJerseyNumber(number: input))
        }
    }
    
    func testDiscardsNegativeNumberInputs() {
        let testInputs = [Int]((-9)...(-1)).map({ String($0) })
        
        testInputs.forEach { (input) in
            XCTAssertNil(BasketballJerseyNumber(number: input))
        }
    }
    
    func testDiscardsOtherThan0to5WithRule() {
        numbersWith6to9.forEach { (input) in
            XCTAssertNil(BasketballJerseyNumber(number: input, validationRules: [.only0to5]))
        }
        
        numbersWith6to9LeadingZeros.forEach { (input) in
            XCTAssertNil(BasketballJerseyNumber(number: input, validationRules: [.only0to5]))
        }
    }
    
    func testDontAllow00() {
        XCTAssertNil(BasketballJerseyNumber(number: "00", validationRules: [.doubleZeroNotAllowed]))
    }
    
    func testDontAllowLeadingZeros() {
        leadingZeros.forEach { (input) in
            XCTAssertNil(BasketballJerseyNumber(number: input, validationRules: [.noLeadingZeros]))
        }
    }
    
    func testIsCustomStringConvertible() {
        zeroTo99and00.forEach { (input) in
            XCTAssertEqual("\(BasketballJerseyNumber(number: input)!)", input)
        }
    }
    
    func testIsHashable() {
        zeroTo99and00.forEach { (input) in
            XCTAssert(BasketballJerseyNumber(number: input)! == BasketballJerseyNumber(number: input)!)
        }
    }
}
