//
//  Date+Extensions.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

extension Date {
  static let julianDateAtUnixEpoch = 2440587.5
  static let julianDateAtJ2000 = 2451545.0
  static let julianDateAtMartianPrimeMeridianMidnightAfterJ2000 = 4.5
  static let julianDaysFromUnixEpochToJ2000 = Date.julianDateAtJ2000 - Date.julianDateAtUnixEpoch
  static let julianDaysFromUnixEpochToMartianPrimeMeridianMidnightAfterJ2000 = Date.julianDateAtJ2000 - Date.julianDateAtUnixEpoch + Date.julianDateAtMartianPrimeMeridianMidnightAfterJ2000
  static let martianSolarDateAtJ2000 = 44796.0
  static let martianPrimeMeridianMidnightOffset = -0.00096

  func timeIntervalSince(epoch: Epoch, timeStandard: TimeStandard) -> Second {
    switch epoch {
    case .julian:
      return timeIntervalSince1970
        + Date.julianDateAtUnixEpoch * Second.perJulianDay
        + timeStandard.offset
    case .unix:
      return timeIntervalSince1970
        + timeStandard.offset
    case .j2000:
      return timeIntervalSince1970
        - Date.julianDaysFromUnixEpochToJ2000 * Second.perJulianDay
        + timeStandard.offset
    case .martianSol:
      return timeIntervalSince1970
        - Date.julianDaysFromUnixEpochToMartianPrimeMeridianMidnightAfterJ2000 * Second.perJulianDay
        + timeStandard.offset
    }
  }

    // if given the Julian epoch, UTC, and julian scale, this returns the "julian universal date"
    // if given the Julian epoch, TT, and julian scale, this returns the "terrestrial universal date"
    // if given the J2000 epoch, TT, and julian scale, this returns the terrestrial days since J2000
    // if given the martian solar epoch, TT, and solar scale, this returns the martial solar date
    func daysSince(epoch: Epoch, timeStandard: TimeStandard, scale: DayScale = .julian) -> Day {
      return timeIntervalSince(epoch: epoch, timeStandard: timeStandard) / scale.length
    }

    // todo: if we compute this in seconds first (instead of julian days) we don't need to divide by a ratio, i think
    func martianSolDate() -> Day {
      let offsetDays = timeIntervalSince(epoch: .martianSol, timeStandard: .terrestrial) / DayScale.solar.length
      return offsetDays
        + Date.martianSolarDateAtJ2000
        + Date.martianPrimeMeridianMidnightOffset
    }
}