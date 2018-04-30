//
//  Day.swift
//  MarsCalendar-iOS
//
//  Created by ad laos on 4/29/18.
//  Copyright © 2018 STVR. All rights reserved.
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
            return seconds_per_julian_day
        case .solar:
            return seconds_per_martian_solar_day
        }
    }
}
