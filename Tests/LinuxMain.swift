import XCTest

import graphTests

var tests = [XCTestCaseEntry]()
tests += graphTests.allTests()
XCTMain(tests)