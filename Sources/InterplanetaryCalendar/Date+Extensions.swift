//
//  Date+Extensions.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

// todo: find better names and re-enable swiftlint
// swiftlint:disable identifier_name
// swiftlint:disable line_length

extension Date {
  static let julianDateAtUnixEpoch = 2440587.5
  static let julianDateAtNTPEpoch = 2415020.5
  static let julianDateAtJ2000 = 2451545.0 // maybe 2451544.5
  static let julianDateAtMartianPrimeMeridianMidnightAfterJ2000 = 4.5
  static let julianDaysFromUnixEpochToJ2000 = Date.julianDateAtJ2000 - Date.julianDateAtUnixEpoch
  static let julianDaysFromUnixEpochToMartianPrimeMeridianMidnightAfterJ2000 = Date.julianDateAtJ2000 - Date.julianDateAtUnixEpoch + Date.julianDateAtMartianPrimeMeridianMidnightAfterJ2000
  static let martianSolarDateAtJ2000 = 44796.0
  static let martianPrimeMeridianMidnightOffset = -0.00096

  // allows constructing dates from leapsecond formatting
  // Foundation doesn't allow 60 seconds :(
  init?(leapSecondFormat: String) {
    let split = leapSecondFormat.split(separator: " ")

    // "1972 Jun 30 24:00:00"
    guard let year = split[optional: 0],
      let month = split[optional: 1],
      let day = split[optional: 2],
      let time = split[optional: 3] else {
      return nil
    }

    let splitTime = time.split(separator: ":")

    guard let hour = splitTime[optional: 0],
      let minute = splitTime[optional: 1],
      let second = splitTime[optional: 2] else {
      return nil
    }

    // we could get these from Calendar.current but the "current" calendar could be anything
    // and leap second formats (it would seem) are gregorian
    // if we create a new gregorian calendar, the short names are "M01", "M02", etc (???)
    // practically speaking, leap seconds are always in June or December, so we only really need two here
    let symbols = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    guard let yearInt = Int(year),
      let dayInt = Int(day),
      let hourInt = Int(hour),
      let minuteInt = Int(minute),
      let secondInt = Int(second),
      let zeroIndexMonthInt = symbols.index(of: String(month)) else {
      return nil
    }

    let components = DateComponents(year: yearInt,
                                    month: zeroIndexMonthInt + 1,
                                    day: dayInt,
                                    hour: hourInt,
                                    minute: minuteInt,
                                    second: secondInt)

    guard let date = Calendar(identifier: .gregorian).date(from: components) else {
      return nil
    }

    self = date
  }

  func timeIntervalSince(epoch: Epoch, timeStandard: TimeStandard) -> Second {
    switch epoch {
    case .julian:
      return timeIntervalSince1970
        + Date.julianDateAtUnixEpoch * Second.perJulianDay
        + timeStandard.offset
    case .networkTimeProtocol:
      return timeIntervalSince1970
        + Date.julianDateAtNTPEpoch * Second.perJulianDay
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
