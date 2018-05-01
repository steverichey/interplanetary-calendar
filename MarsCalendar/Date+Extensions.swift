//
//  Date+Extensions.swift
//  MarsCalendar-iOS
//
//  Created by ad laos on 4/29/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

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

enum Epoch {
    // sort of an arbitrary time, long ago
    case julian
    // january 1, 1970 (this is the default in Foundation)
    case unix
    // january 1, 2000 gregorian
    case j2000
    // December 29, 1873 (the birth date of astronomer Carl Otto Lampland)
//    case martianSol
}

extension Date {
    func timeIntervalSince(epoch: Epoch, timeStandard: TimeStandard) -> Second {
        switch epoch {
        case .julian:
            return timeIntervalSince1970
                + julian_date_at_unix_epoch * seconds_per_julian_day
                + timeStandard.offset
        case .unix:
            return timeIntervalSince1970
                + timeStandard.offset
        case .j2000:
            return timeIntervalSince1970
                + (julian_date_at_unix_epoch - julian_date_at_j2000) * seconds_per_julian_day
                + timeStandard.offset
        }
    }

    // if given the Julian epoch and UTC, this returns the "julian universal date"
    // if given the Julian epoch and TT, this returns the "terrestrial universal date"
    // if given the J2000 epoch and TT, this returns the terrestrial days since J2000
    func julianDaysSince(epoch: Epoch, timeStandard: TimeStandard) -> Day {
        return timeIntervalSince(epoch: epoch, timeStandard: timeStandard) / seconds_per_julian_day
    }

    func martianSolDate() -> Day {
        let julianDays = julianDaysSince(epoch: .j2000, timeStandard: .terrestrial)
        let offsetDays = julianDays - julian_date_at_martian_prime_meridian_midnight_after_j2000
        let ratio = Planet.mars.secondsPerSolarDay / Planet.earth.secondsPerSolarDay
        return offsetDays / ratio
            + martian_sols_since_martian_sol_epoch
            + martian_prime_meridian_midnight_offset
    }
}
