//
//  LeapSecond+Tests.swift
//  InterplanetaryCalendarTests
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import XCTest
@testable import InterplanetaryCalendar

class LeapSecondTests: XCTestCase {
  func testLeapSecondsBefore() {
    XCTAssertEqual(0, LeapSecond.before(date: Date(timeIntervalSince1970: 0)))
    XCTAssertEqual(37, LeapSecond.before(date: Date()))
  }

  func testLeapSecondsFromTo() {
    XCTAssertEqual(0, LeapSecond.from(Date(), to: Date()))
    XCTAssertEqual(37, LeapSecond.from(Date(timeIntervalSince1970: 0), to: Date()))
  }

  func testLeapSecondsAfter() {
    XCTAssertEqual(0, LeapSecond.after(date: Date()))
    XCTAssertEqual(37, LeapSecond.after(date: Date(timeIntervalSince1970: 0)))
  }

  func testAll() {
    XCTAssertEqual(28, LeapSecond.all.count)
  }

  static var allTests = [
    ("testLeapSecondsBefore", testLeapSecondsBefore),
    ("testLeapSecondsFromTo", testLeapSecondsFromTo),
    ("testLeapSecondsAfter", testLeapSecondsAfter),
    ("testAll", testAll)
  ]
}
