import OhceCore
import Foundation

do {
    let ohce = try Ohce()
    try ohce.run(arguments: ProcessInfo.processInfo.arguments)
} catch {
    print(error)
}
