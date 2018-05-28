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
  // convert a time interval in seconds to a type of day scale
  func convertTo(days: DayScale) -> Day {
    return self / days.length
  }
}

extension Day {
  func convertToSeconds(scale: DayScale) -> Second {
    return self * scale.length
  }
}
