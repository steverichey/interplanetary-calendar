//
//  TimeStandard.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

// how much TAI is ahead of UTC
// 10 seconds as of 1972, plus 27 leap seconds added since
private let utc_tai_offset = 37.0
// how much TT is ahead of TAI
private let tai_tt_offset = 32.184

enum TimeStandard {
    case coordinatedUniversal
    case internationalAtomic
    case terrestrial

    var offset: Second {
        switch self {
        case .coordinatedUniversal:
            return 0
        case .internationalAtomic:
            return utc_tai_offset
        case .terrestrial:
            return utc_tai_offset + tai_tt_offset
        }
    }
}
