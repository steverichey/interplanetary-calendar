//
//  MarsCalendarTests.swift
//  MarsCalendarTests
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import XCTest
@testable import MarsCalendar_iOS

private let minuteInSeconds: Double = 60
private let hourInMinutes: Double = 60
private let hourInSeconds: Double = hourInMinutes * minuteInSeconds
private let earthDayInHours: Double = 24
private let earthDayInMinutes: Double = earthDayInHours * hourInMinutes
private let earthDayInSeconds: Double = earthDayInMinutes * minuteInSeconds

class MarsCalendarTests: XCTestCase {
    func testMass() {
        XCTAssertPow(Planet.mercury.mass, 23);
        XCTAssertPow(Planet.venus.mass, 24);
        XCTAssertPow(Planet.earth.mass, 24);
        XCTAssertPow(Planet.mars.mass, 23);
        XCTAssertPow(Planet.jupiter.mass, 27);
        XCTAssertPow(Planet.saturn.mass, 26);
        XCTAssertPow(Planet.uranus.mass, 25);
        XCTAssertPow(Planet.neptune.mass, 26);
    }

    func testStandardGravitationalParameter() {
        XCTAssertEqual(22_032, Planet.mercury.standardGravitationalParameter, percentAccuracy: 0.1)
        XCTAssertEqual(324_859, Planet.venus.standardGravitationalParameter, percentAccuracy: 0.1)
        XCTAssertEqual(398_600.4418, Planet.earth.standardGravitationalParameter, percentAccuracy: 0.1)
        XCTAssertEqual(42_828.37, Planet.mars.standardGravitationalParameter, percentAccuracy: 0.1)
        XCTAssertEqual(126_686_534, Planet.jupiter.standardGravitationalParameter, percentAccuracy: 0.1)
        XCTAssertEqual(37_931_187, Planet.saturn.standardGravitationalParameter, percentAccuracy: 0.1)
        XCTAssertEqual(5_793_939, Planet.uranus.standardGravitationalParameter, percentAccuracy: 0.1)
        XCTAssertEqual(6_836_529, Planet.neptune.standardGravitationalParameter, percentAccuracy: 0.1)
    }

    func testCircumference() {
        XCTAssertEqual(21_344, Planet.mars.circumference, accuracy: 1000)
    }

    func testRotationalVelocity() {
        XCTAssertEqual(0.24117, Planet.mars.rotationalVelocity, accuracy: 0.1)
    }

    func testDayLength() {
        XCTAssertEqual(24 * hourInSeconds, Planet.earth.siderealRotationPeriod, accuracy: 400)
        XCTAssertEqual(24.6597899 * hourInSeconds, Planet.mars.siderealRotationPeriod, accuracy: 400)
    }

    func testAphelion() {
        XCTAssertEqual(227_936_637, Planet.mars.aphelion, accuracy: 100_000_000)
    }

    func testPerihelion() {
        XCTAssertEqual(226_939_986, Planet.mars.perihelion, accuracy: 30_000_000)
    }

    func testSemiMinorAxis() {
        XCTAssertEqual(56_671_523, Planet.mercury.semiMinorAxis, accuracy: 1_000_0000)
        XCTAssertEqual(226_939_986, Planet.mars.semiMinorAxis, accuracy: 1_000_0000)
    }

    func testSemiMajorAxis() {
        XCTAssertEqual(57_909_050, Planet.mercury.semiMajorAxis, accuracy: 1_000_000)
        XCTAssertEqual(227_936_637, Planet.mars.semiMajorAxis, accuracy: 1_000_000)
    }

    func testOrbitalVelocity() {
        XCTAssertEqual(30.3, Planet.earth.orbitalVelocity(at: Planet.earth.perihelion, from: Star.sun), accuracy: 0.1)
    }

    func testMeanOrbitalVelocity() {
        XCTAssertEqual(30, Planet.earth.meanOrbitalVelocity(around: Star.sun), accuracy: 0.5)
    }

    func testOrbitalPeriod() {
        XCTAssertEqual(365 * earthDayInSeconds, Planet.earth.orbitalPeriod(around: Star.sun), accuracy: 100_000)
        XCTAssertEqual(59_355_036, Planet.mars.orbitalPeriod(around: Star.sun), accuracy: 100_000)
    }
}
