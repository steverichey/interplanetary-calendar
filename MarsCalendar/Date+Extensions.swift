//
//  Date+Extensions.swift
//  MarsCalendar-iOS
//
//  Created by ad laos on 4/29/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

extension Date {
    // a count of julian days since the Unix epoch
    var julianDaysSince1970: Double {
        return timeIntervalSince1970 / seconds_per_julian_day
    }

    // the number of days since the julian epoch
    var julianUniversalDate: Double {
        return julianDaysSince1970 + julian_date_at_unix_epoch
    }

    // the number of days since the julian epoch including leap seconds
    var terrestrialUniversalDate: Double {
        return julianUniversalDate + total_julian_leap_seconds / seconds_per_julian_day
    }

    var terrestrialDaysSinceJ2000: Double {
        return terrestrialUniversalDate - julian_date_at_j2000
    }
}
