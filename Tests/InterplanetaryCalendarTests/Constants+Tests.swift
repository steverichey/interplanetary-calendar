//
//  Constants+Tests.swift
//  InterplanetaryCalendarTests
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import XCTest
@testable import InterplanetaryCalendar

private let minuteInSeconds: Double = 60
private let hourInMinutes: Double = 60
private let hourInSeconds: Double = hourInMinutes * minuteInSeconds
private let earthDayInHours: Double = 24
private let earthDayInMinutes: Double = earthDayInHours * hourInMinutes
private let earthDayInSeconds: Double = earthDayInMinutes * minuteInSeconds

class ConstantsTests: XCTestCase {
  func testMass() {
    // stars
    XCTAssertPow(Star.sun.mass, 30)

    // planets
    XCTAssertPow(Planet.mercury.mass, 23)
    XCTAssertPow(Planet.venus.mass, 24)
    XCTAssertPow(Planet.earth.mass, 24)
    XCTAssertPow(Planet.mars.mass, 23)
    XCTAssertPow(Planet.jupiter.mass, 27)
    XCTAssertPow(Planet.saturn.mass, 26)
    XCTAssertPow(Planet.uranus.mass, 25)
    XCTAssertPow(Planet.neptune.mass, 26)

    // moons
    XCTAssertPow(Moon.moon.mass, 22)
  }

  func testStandardGravitationalParameter() {
    // stars
    XCTAssertEqual(132_712_440_018, Star.sun.standardGravitationalParameter, percentAccuracy: 0.1)

    // planets
    XCTAssertEqual(22_032, Planet.mercury.standardGravitationalParameter, percentAccuracy: 0.1)
    XCTAssertEqual(324_859, Planet.venus.standardGravitationalParameter, percentAccuracy: 0.1)
    XCTAssertEqual(398_600.4418, Planet.earth.standardGravitationalParameter, percentAccuracy: 0.1)
    XCTAssertEqual(42_828.37, Planet.mars.standardGravitationalParameter, percentAccuracy: 0.1)
    XCTAssertEqual(126_686_534, Planet.jupiter.standardGravitationalParameter, percentAccuracy: 0.1)
    XCTAssertEqual(37_931_187, Planet.saturn.standardGravitationalParameter, percentAccuracy: 0.1)
    XCTAssertEqual(5_793_939, Planet.uranus.standardGravitationalParameter, percentAccuracy: 0.1)
    XCTAssertEqual(6_836_529, Planet.neptune.standardGravitationalParameter, percentAccuracy: 0.1)

    // moons
    XCTAssertEqual(4_904.8695, Moon.moon.standardGravitationalParameter, percentAccuracy: 0.1)
  }

  func testCircumference() {
    XCTAssertEqual(21_344, Planet.mars.equatorialCircumference, percentAccuracy: 0.1)
    XCTAssertEqual(40_075, Planet.earth.meanCircumference, percentAccuracy: 0.1)
  }

  func testEllipsoid() {
    XCTAssertEqual(6_356.7523142, Planet.earth.polarRadius, percentAccuracy: 0.001)
    XCTAssertEqual(Planet.mars.equatorialRadius, Planet.mars.polarRadius, percentAccuracy: 0.001)
  }

  func testVolume() {
    XCTAssertEqual(1e12, Planet.earth.volume, percentAccuracy: 0.1)
  }

  func testRotationalVelocity() {
    XCTAssertEqual(0.24117, Planet.mars.rotationalVelocity, percentAccuracy: 0.1)
  }

  func testJulianDay() {
//        XCTAssertEqual(24 * 60 * 60, Planet.earth.julian.day)
//        print("julian: \(Planet.earth.julian.day), sidereal: \(Planet.earth.sidereal.day)")
  }

  func testSiderealDay() {
    XCTAssertEqual(1.027491252, Planet.mars.siderealRotationPeriod / Planet.earth.siderealRotationPeriod, percentAccuracy: 0.01)
  }

  func testMartianYear() {
    XCTAssertEqual(686.9726, Planet.mars.orbitalPeriod(around: Star.sun).convertTo(convention: .earth), percentAccuracy: 0.01)
    XCTAssertEqual(668.5921, Planet.mars.orbitalPeriod(around: Star.sun).convertTo(convention: .mars), percentAccuracy: 0.01)
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

  static var allTests = [
    ("testMass", testMass),
    ("testStandardGravitationalParameter", testStandardGravitationalParameter),
    ("testCircumference", testCircumference),
    ("testEllipsoid", testEllipsoid),
    ("testVolume", testVolume),
    ("testRotationalVelocity", testRotationalVelocity),
    ("testJulianDay", testJulianDay),
    ("testSiderealDay", testSiderealDay),
    ("testMartianYear", testMartianYear),
    ("testAphelion", testAphelion),
    ("testPerihelion", testPerihelion),
    ("testSemiMinorAxis", testSemiMinorAxis),
    ("testSemiMajorAxis", testSemiMajorAxis),
    ("testOrbitalVelocity", testOrbitalVelocity),
    ("testMeanOrbitalVelocity", testMeanOrbitalVelocity),
    ("testOrbitalPeriod", testOrbitalPeriod)
  ]
}
