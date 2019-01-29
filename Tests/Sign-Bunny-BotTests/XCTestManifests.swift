import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Sign_Bunny_BotTests.allTests),
    ]
}
#endif