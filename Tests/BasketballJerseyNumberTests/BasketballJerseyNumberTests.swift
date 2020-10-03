import XCTest
@testable import BasketballJerseyNumber

final class BasketballJerseyNumberTests: XCTestCase {
    func testTypesUseProtocol() {
        let jerseyNumbers: [BasketballJerseyNumber?] = [
            NCAAJerseyNumber(number: "0"),
            PZKoszJerseyNumber(number: "0"),
            FIBAJerseyNumber(number: "0")
        ]
        
        XCTAssertEqual(jerseyNumbers.count, 3)
    }
    
    func testCanAccessNumberValue() {
        let jerseyNumbers: [BasketballJerseyNumber?] = [
            NCAAJerseyNumber(number: "0"),
            PZKoszJerseyNumber(number: "0"),
            FIBAJerseyNumber(number: "0")
        ]
        
        jerseyNumbers.compactMap({ $0 }).forEach { (jersey) in
            XCTAssertEqual(jersey.number, "0")
        }
    }
}
