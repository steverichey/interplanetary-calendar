//
//  TimeStandard.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

// maybe this should be TimeScale
enum TimeStandard {
  case coordinatedUniversal
  case internationalAtomic
  case terrestrial

  var offset: Second {
    switch self {
    case .coordinatedUniversal:
      return 0
    case .internationalAtomic:
      // how much TAI is ahead of UTC
      // 10 seconds as of 1972, plus 27 leap seconds added since
      return 10.0 + LeapSecond.total
    case .terrestrial:
      // how much TT is ahead of TAI
      return TimeStandard.internationalAtomic.offset + 32.184
    }
  }
}
