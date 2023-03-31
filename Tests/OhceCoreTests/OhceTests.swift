import XCTest
@testable import OhceCore

final class OhceTests: XCTestCase {

    func testExample() throws {

        let sut = try Ohce()
        try sut.run()
    }

}