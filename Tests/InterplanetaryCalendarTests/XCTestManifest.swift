//
//  XCTestManifest.swift
//  InterplanetaryCalendarTests
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(DateTests.allTests),
    testCase(ConstantsTests.allTests)
  ]
}
#endif
