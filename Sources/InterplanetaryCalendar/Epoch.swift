//
//  Epoch.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

private let julian_date_at_unix_epoch = 2440587.5
private let julian_date_at_j2000 = 2451545.0
private let seconds_per_julian_day = 86400.0
private let seconds_per_martian_solar_day = 88775.244

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
            return julian_date_at_unix_epoch
        case .j2000:
            return julian_date_at_j2000
        case .martianSol:
            return 0
        }
    }
}
