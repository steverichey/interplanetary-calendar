//
//  DayScale.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

private let seconds_per_julian_day = 86400.0
private let seconds_per_martian_solar_day = 88775.244

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
            return seconds_per_julian_day
        case .solar:
            return seconds_per_martian_solar_day
        }
    }
}
