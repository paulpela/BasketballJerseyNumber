import XCTest
@testable import BasketballJerseyNumber

final class BasketballJerseyNumberTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BasketballJerseyNumber().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
