import OhceCore

do {
    let ohce = try Ohce()
    try ohce.run()
} catch {
    print(error)
}