import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(undirectedGraphTests.allTests),
        testCase(directedGraphTests.allTests)
    ]
}
#endif
