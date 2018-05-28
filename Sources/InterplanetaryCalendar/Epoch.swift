//
//  Epoch.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

enum Epoch {
  // sort of an arbitrary time, long ago
  case julian
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
    case .unix:
        return Date.julianDateAtUnixEpoch
    case .j2000:
        return Date.julianDateAtJ2000
    case .martianSol:
        return 0
    }
  }
}
