import Foundation

protocol TimeChecker {
    var timeOfDay: TimeOfDay { get }
}

enum TimeOfDay {
    case night
    case morning
    case afternoon
}

class TimeCheckerImpl: TimeChecker {
    
    var timeOfDay: TimeOfDay {
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour >= 20 || hour < 6 {
            return .night
        }
        
        if hour >= 6 && hour < 12 {
            return .morning
        }
        
        return .afternoon
    }
    
}
