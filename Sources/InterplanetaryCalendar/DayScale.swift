//
//  DayScale.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

enum DayScale {
  case julian
  case solar

  var planet: Planet {
    switch self {
    case .julian:
      return .earth
    case .solar:
      return .mars
    }
  }

  var length: Second {
    switch self {
    case .julian:
      return Second.perJulianDay
    case .solar:
      return Second.perMartianSolarDay
    }
  }
}
