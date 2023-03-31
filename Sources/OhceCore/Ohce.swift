import Foundation

public struct Ohce {
    
    enum Error: Swift.Error {
        case invalidArguments
    }

    public init() throws {}

    public func run(arguments: [String]) throws {
        
        guard arguments.count >= 2 else {
            throw Error.invalidArguments
        }
        
        ohce(name: arguments[1])
    }
    
    func ohce(name: String) {
        
        let bot = OhceBot(timeChecker: TimeCheckerImpl(), name: name)
        output(bot.welcome())
        while let input = promptLine() {
            for action in bot.say(input) {
                switch action {
                case .print(let string):
                    output(string)
                    
                case .terminate:
                    exit(0)
                }
            }
        }
    }
    
    func promptLine() -> String? {
        
        print("$", terminator: " ")
        return readLine()
    }
    
    func output(_ string: String) {
        print("> \(string)")
    }
    
}
