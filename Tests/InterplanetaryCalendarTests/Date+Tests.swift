//
//  Date+Tests.swift
//  InterplanetaryCalendarTests
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import XCTest
@testable import InterplanetaryCalendar

@available(iOS 10.0, macOS 10.12, *)
class DateTests: XCTestCase {
  var date: Date {
    return ISO8601DateFormatter().date(from: "2018-05-01T04:10:55Z")!
  }

  func testInit() {
    XCTAssertEqual(Date(timeInterval: 0, since: .unix).timeIntervalSince1970, 0)
  }

  // test some static values from a http://jtauber.github.io/mars-clock/ screengrab
  func testTimeIntervalSince() {
    XCTAssertEqual(1525147855.592,
      date.timeIntervalSince(epoch: .unix, timeStandard: .coordinatedUniversal),
      percentAccuracy: 0.00001)
  }

  func testDaysSinceJulianUTC() {
    XCTAssertEqual(2458239.67425,
      date.daysSince(epoch: .julian, timeStandard: .coordinatedUniversal),
      percentAccuracy: 0.00001)
  }

  func testDaysSinceJulianTT() {
    XCTAssertEqual(2458239.67506,
      date.daysSince(epoch: .julian, timeStandard: .terrestrial),
      percentAccuracy: 0.00001)
  }

  func testDaysSinceJ2000TT() {
    XCTAssertEqual(6694.67506,
      date.daysSince(epoch: .j2000, timeStandard: .terrestrial),
      percentAccuracy: 0.00001)
  }

  func testMartianSolDate() {
    // todo: revise this equation to enable stricter accuracy
    XCTAssertEqual(51307.17813,
      date.martianSolDate(),
      percentAccuracy: 0.001)
  }

  static var allTests = [
    ("testInit", testInit),
    ("testTimeIntervalSince", testTimeIntervalSince),
    ("testDaysSinceJulianUTC", testDaysSinceJulianUTC),
    ("testDaysSinceJulianTT", testDaysSinceJulianTT),
    ("testDaysSinceJ2000TT", testDaysSinceJ2000TT),
    ("testMartianSolDate", testMartianSolDate)
  ]
}
