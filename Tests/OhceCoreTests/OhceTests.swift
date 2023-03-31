import XCTest
@testable import OhceCore

final class OhceBotTests: XCTestCase {

    func testWelcome_morning() throws {

        let sut = makeBot(timeOfDay: .morning, name: "Matthew")
        XCTAssertEqual(sut.welcome(), "¡Buenos días Matthew!")
    }

    func testWelcome_afternoon() throws {

        let sut = makeBot(timeOfDay: .afternoon, name: "John")
        XCTAssertEqual(sut.welcome(), "¡Buenas tardes John!")
    }

    func testWelcome_night() throws {

        let sut = makeBot(timeOfDay: .night, name: "Sarah")
        XCTAssertEqual(sut.welcome(), "¡Buenas noches Sarah!")
    }
    
    func testSay_hola() throws {
        
        let sut = makeBot(timeOfDay: .morning, name: "Matthew")
        XCTAssertEqual(sut.say("hola"), [.print("aloh")])
    }
    
    func testSay_oto() throws {
        
        let sut = makeBot(timeOfDay: .morning, name: "Matthew")
        XCTAssertEqual(sut.say("oto"), [.print("oto"), .print("¡Bonita palabra!")])
    }
    
    func testSay_stop() throws {

        let sut = makeBot(timeOfDay: .morning, name: "Matthew")
        XCTAssertEqual(sut.say("Stop!"), [.print("Adios Matthew"), .terminate])
    }

}

extension OhceBotTests {
    
    func makeBot(timeOfDay: TimeOfDay, name: String) -> OhceBot {
        
        let timeChecker = TimeCheckerStub()
        timeChecker.timeOfDay = timeOfDay
        return OhceBot(timeChecker: timeChecker, name: name)
    }
    
}

class TimeCheckerStub: TimeChecker {

    var timeOfDay: OhceCore.TimeOfDay = .morning

}
