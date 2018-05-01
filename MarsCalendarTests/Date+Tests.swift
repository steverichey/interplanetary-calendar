//
//  Date+Tests.swift
//  MarsCalendarTests
//
//  Created by ad laos on 4/30/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation
import XCTest
@testable import MarsCalendar_iOS

class DateTests: XCTestCase {
    func testTimeSince() {
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: "2018-05-01T04:10:55Z") else {
            return XCTFail("unable to create date")
        }

        // test some static values from a http://jtauber.github.io/mars-clock/ screengrab
        XCTAssertEqual(1525147855.592, date.timeIntervalSince(epoch: .unix, timeStandard: .coordinatedUniversal), percentAccuracy: 0.00001)
        XCTAssertEqual(2458239.67425, date.julianDaysSince(epoch: .julian, timeStandard: .coordinatedUniversal), percentAccuracy: 0.00001)
        XCTAssertEqual(2458239.67506, date.julianDaysSince(epoch: .julian, timeStandard: .terrestrial), percentAccuracy: 0.00001)
        XCTAssertEqual(6694.67506, date.julianDaysSince(epoch: .j2000, timeStandard: .terrestrial), percentAccuracy: 0.00001)

        // now martian sol dates
        XCTAssertEqual(51307.17813, date.martianSolDate(), percentAccuracy: 0.00001)
    }
}
