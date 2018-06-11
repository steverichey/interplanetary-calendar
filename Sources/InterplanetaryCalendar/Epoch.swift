//
//  Epoch.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

enum Epoch {
  // noon on Monday, January 1, 4713 BC, proleptic Julian calendar
  // November 24, 4714 BC, in the proleptic Gregorian calendar
  case julian
  // January 1, 1900
  case networkTimeProtocol
  // january 1, 1970 (this is the default in Foundation)
  case unix
  // january 1, 2000 gregorian
  case j2000
  // December 29, 1873 (the birth date of astronomer Carl Otto Lampland)
  case martianSol

  var julianDate: Day {
    switch self {
    case .julian:
        return 0
    case .networkTimeProtocol:
      return Date.julianDateAtNTPEpoch
    case .unix:
        return Date.julianDateAtUnixEpoch
    case .j2000:
        return Date.julianDateAtJ2000
    case .martianSol:
        return Date.julianDateAtMartianSolarEpoch
    }
  }

  // this should either take a convention or not use one at all
  var julianSeconds: Second {
    return julianDate * DayConvention.earth.rawValue
  }
}
