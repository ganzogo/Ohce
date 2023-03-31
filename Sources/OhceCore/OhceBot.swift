
class OhceBot {
    
    enum Action: Equatable {
        case print(String)
        case terminate
    }
    
    private let timeChecker: TimeChecker
    private let name: String
    
    init(timeChecker: TimeChecker, name: String) {
        
        self.timeChecker = timeChecker
        self.name = name
    }
    
    func welcome() -> String {
        
        let greeting = timeChecker.timeOfDay.greeting
        return "¡\(greeting) \(name)!"
    }
    
    func say(_ input: String) -> [Action] {
        
        guard input != "Stop!" else {
            return [.print("Adios \(name)"), .terminate]
        }
        
        let reversed = String(input.reversed())
        var response = [reversed]
        if input == reversed {
            response.append("¡Bonita palabra!")
        }
        return response.map { .print($0) }
    }

}

extension TimeOfDay {
    
    var greeting: String {
        
        switch self {
        case .morning: return "Buenos días"
        case .afternoon: return "Buenas tardes"
        case .night: return "Buenas noches"
        }
    }
    
}
