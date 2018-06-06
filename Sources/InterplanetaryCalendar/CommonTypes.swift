//
//  CommonTypes.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

typealias Kilometer = Double
typealias CubicKilometer = Double
typealias Second = TimeInterval
typealias Day = Double
typealias KilometerPerSecond = Double
typealias Kilogram = Double
typealias KilogramPerCubicKilometer = Double
typealias CubicKilometerPerKilogramSquareSecond = Double
typealias CubicKilometerPerSquareSecond = Double

extension Second {
  // seconds in a conventional earth day
  static let perJulianDay = 86400.0
  // seconds in a martian solar day
  static let perMartianSolarDay = 88775.244

  // convert a time interval in seconds to a type of day scale
  func convertTo(convention: DayConvention) -> Day {
    return self / convention.rawValue
  }
}

extension Day {
  func convertToSeconds(convention: DayConvention) -> Second {
    return self * convention.rawValue
  }
}
