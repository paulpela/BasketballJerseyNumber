import XCTest
@testable import BasketballJerseyNumber

final class CopyingTests: XCTestCase {
    func test_can_copy_without_any_rules() {
        XCTAssertEqual(BasketballJerseyNumber(number: "10")!, BasketballJerseyNumber(number: "10")?.copy(usingValidationRules: [])!)
    }
    
    func test_can_copy_with_one_rule() {
        XCTAssertEqual(
            BasketballJerseyNumber(number: "16")?.copy(usingValidationRules: [.doubleZeroNotAllowed])!,
            BasketballJerseyNumber(number: "16")!
        )
    }
    
    func test_copy_validates_00() {
        XCTAssertNil(BasketballJerseyNumber(number: "00")?.copy(usingValidationRules: [.doubleZeroNotAllowed]))
    }
    
    func test_copy_can_use_multiple_rules() {
        XCTAssertNil(BasketballJerseyNumber(number: "00")?.copy(usingValidationRules: [.doubleZeroNotAllowed, .only0to5]))
        
        XCTAssertNil(BasketballJerseyNumber(number: "16")?.copy(usingValidationRules: [.noLeadingZeros, .only0to5]))
        
        XCTAssertNil(BasketballJerseyNumber(number: "06")?.copy(usingValidationRules: [.noLeadingZeros, .only0to5]))
    }
}
