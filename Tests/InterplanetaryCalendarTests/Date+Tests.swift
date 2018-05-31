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
  func testTimeSince() {
    let dateFormatter = ISO8601DateFormatter()

    guard let date = dateFormatter.date(from: "2018-05-01T04:10:55Z") else {
      return XCTFail("unable to create date")
    }

    // test some static values from a http://jtauber.github.io/mars-clock/ screengrab
    XCTAssertEqual(1525147855.592,
      date.timeIntervalSince(epoch: .unix, timeStandard: .coordinatedUniversal),
      percentAccuracy: 0.00001)
    XCTAssertEqual(2458239.67425,
      date.daysSince(epoch: .julian, timeStandard: .coordinatedUniversal),
      percentAccuracy: 0.00001)
    XCTAssertEqual(2458239.67506,
      date.daysSince(epoch: .julian, timeStandard: .terrestrial),
      percentAccuracy: 0.00001)
    XCTAssertEqual(6694.67506,
      date.daysSince(epoch: .j2000, timeStandard: .terrestrial),
      percentAccuracy: 0.00001)

    // now martian sol dates
    XCTAssertEqual(51307.17813, date.martianSolDate(), percentAccuracy: 0.00001)
  }

  func testInitLeapSecondFormat() {
    XCTAssertNotNil(Date(leapSecondFormat: "1972 Jun 30 23:59:60"))
    XCTAssertNotNil(Date(leapSecondFormat: "1982 Jun 30 23:59:60"))
    XCTAssertNotNil(Date(leapSecondFormat: "2008 Dec 31 23:59:60"))
  }

  static var allTests = [
    ("testTimeSince", testTimeSince),
    ("testInitLeapSecondFormat", testInitLeapSecondFormat)
  ]
}
