import XCTest

extension TimeTests {
    static let __allTests = [
        ("testDescription", testDescription),
        ("testDouble", testDouble),
        ("testDuration", testDuration),
        ("testFromString", testFromString),
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
