import XCTest

extension TimeTests {
    static let __allTests = [
        ("testDuration", testDuration),
        ("testInterval", testInterval),
        ("testNow", testNow),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TimeTests.__allTests),
    ]
}
#endif
