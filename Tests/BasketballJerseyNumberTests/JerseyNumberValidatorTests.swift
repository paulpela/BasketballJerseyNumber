import XCTest
@testable import BasketballJerseyNumber

final class JerseyNumberValidatorTests: XCTestCase {
    let NCAAlegalNumbers: [String] = {
        var valid = ["0", "00"]
        
        valid += [Int](1...5).map({ String($0) })
        valid += [Int](10...15).map({ String($0) })
        valid += [Int](20...25).map({ String($0) })
        valid += [Int](30...35).map({ String($0) })
        valid += [Int](40...45).map({ String($0) })
        valid += [Int](50...55).map({ String($0) })
        
        return valid
    }()
    
    let FIBAlegalNumbers = {
        return ["00"] + [Int](0...99).map({ String($0) })
    }()
    
    let FIBA4To15legalNumbers = {
        return [Int](4...15).map({ String($0) })
    }()
    
    let generalInvalidInputs = [
        "123", "abc", "🖥", "🐈", "-1", "-123", "42424234", "lorem ipsum", "@twitterusername", "012"
    ]
    
    func testNCAAWorksForValidInput() {
        NCAAlegalNumbers.forEach { (legalNumber) in
            XCTAssertTrue(NCAARuleNumberValidator.isValid(input: legalNumber))
        }
    }
    
    func testNCAANotWorksForInvalidInput() {
        generalInvalidInputs.forEach { (legalNumber) in
            XCTAssertFalse(NCAARuleNumberValidator.isValid(input: legalNumber))
        }
        
        let specificInvalidInputs = [
            "6", "8", "9", "16", "18", "28", "39", "48", "60", "56", "74", "89", "69", "99"
        ]
        
        specificInvalidInputs.forEach { (legalNumber) in
            XCTAssertFalse(NCAARuleNumberValidator.isValid(input: legalNumber))
        }
    }
    
    func testFIBAWorksForValidInput() {
        FIBAlegalNumbers.forEach { (legalNumber) in
            XCTAssertTrue(FIBARuleNumberValidator.isValid(input: legalNumber))
        }
    }
    
    func testFIBANotWorksForInvalidInput() {
        generalInvalidInputs.forEach { (legalNumber) in
            XCTAssertFalse(FIBARuleNumberValidator.isValid(input: legalNumber))
        }
        
        let specificInvalidInputs = [
            "06", "08", "09", "012"
        ]
        
        specificInvalidInputs.forEach { (legalNumber) in
            XCTAssertFalse(FIBARuleNumberValidator.isValid(input: legalNumber))
        }
    }
    
    func testFIBA4To15WorksForValidInput() {
        FIBAlegalNumbers.forEach { (legalNumber) in
            XCTAssertTrue(FIBARuleNumberValidator.isValid(input: legalNumber))
        }
    }
    
    func testFIBA4To15NotWorksForInvalidInput() {
        generalInvalidInputs.forEach { (legalNumber) in
            XCTAssertFalse(FIBA4To15RuleNumberValidator.isValid(input: legalNumber))
        }
        
        let specificInvalidInputs = [
            "0", "1", "2", "3"
        ]
        
        specificInvalidInputs.forEach { (legalNumber) in
            XCTAssertFalse(FIBA4To15RuleNumberValidator.isValid(input: legalNumber))
        }
    }
}
