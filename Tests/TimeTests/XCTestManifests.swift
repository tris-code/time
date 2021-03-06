#if !canImport(ObjectiveC)
import XCTest

extension TimeTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__TimeTests = [
        ("testDescription", testDescription),
        ("testDouble", testDouble),
        ("testDuration", testDuration),
        ("testEquatable", testEquatable),
        ("testFromString", testFromString),
        ("testInterval", testInterval),
        ("testNow", testNow),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TimeTests.__allTests__TimeTests),
    ]
}
#endif
