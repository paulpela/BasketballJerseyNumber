import XCTest
@testable import BasketballJerseyNumber

final class FollowsRulesTests: XCTestCase {
    func test_can_check_if_follows_rules() {
        XCTAssertTrue(BasketballJerseyNumber(number: "00")!.follows(rules: [.only0to5]))
    }
    
    func test_checks_if_follows_no_00_rule() {
        XCTAssertTrue(BasketballJerseyNumber(number: "10")!.follows(rules: [.doubleZeroNotAllowed]))
        
        XCTAssertFalse(BasketballJerseyNumber(number: "00")!.follows(rules: [.doubleZeroNotAllowed]))
    }
    
    func test_checks_if_follows_no_0_to_5_rule() {
        XCTAssertTrue(BasketballJerseyNumber(number: "00")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "01")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number:  "4")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number:  "5")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "10")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "13")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "23")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "41")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "50")!.follows(rules: [.only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "55")!.follows(rules: [.only0to5]))
        
        XCTAssertFalse(BasketballJerseyNumber(number:  "6")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number:  "7")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "08")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "16")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "19")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "28")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "39")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "47")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "56")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "60")!.follows(rules: [.only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "99")!.follows(rules: [.only0to5]))
    }
    
    func test_00_follows_no_leading_zeros_rule() {
        XCTAssertTrue(BasketballJerseyNumber(number: "00")!.follows(rules: [.noLeadingZeros]))
    }
    
    func test_checks_if_follows_no_leading_zeros_rule() {
        XCTAssertTrue(BasketballJerseyNumber(number: "10")!.follows(rules: [.noLeadingZeros]))
        XCTAssertTrue(BasketballJerseyNumber(number: "13")!.follows(rules: [.noLeadingZeros]))
        XCTAssertTrue(BasketballJerseyNumber(number: "23")!.follows(rules: [.noLeadingZeros]))
        XCTAssertTrue(BasketballJerseyNumber(number: "41")!.follows(rules: [.noLeadingZeros]))
        XCTAssertTrue(BasketballJerseyNumber(number: "50")!.follows(rules: [.noLeadingZeros]))
        XCTAssertTrue(BasketballJerseyNumber(number: "55")!.follows(rules: [.noLeadingZeros]))
        
        XCTAssertFalse(BasketballJerseyNumber(number: "01")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "02")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "03")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "04")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "05")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "06")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "07")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "08")!.follows(rules: [.noLeadingZeros]))
        XCTAssertFalse(BasketballJerseyNumber(number: "09")!.follows(rules: [.noLeadingZeros]))
    }
    
    func test_check_if_follows_all_rules() {
        XCTAssertTrue(BasketballJerseyNumber(number: "10")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "13")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "23")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "41")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "50")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertTrue(BasketballJerseyNumber(number: "55")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        
        XCTAssertFalse(BasketballJerseyNumber(number: "00")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "02")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "03")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "04")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "05")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "06")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "65")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "80")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
        XCTAssertFalse(BasketballJerseyNumber(number: "99")!.follows(rules: [.noLeadingZeros, .doubleZeroNotAllowed, .only0to5]))
    }
}
