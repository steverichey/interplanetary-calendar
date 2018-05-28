//
//  Constants.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

extension Double {
    static var gravitationalConstant: CubicKilometerPerKilogramSquareSecond {
        return 6.67408e-20 // km^3 / kg * s^2
    }

    static let tau = 6.28318530717958647692

    static let speedOfLight = 299792.458 // km/s
    static let astrononicalUnit = 149597870.700 // km
    static let julianDateAtUnixEpoch = 2440587.5
    static let julianDateAtJ2000 =  2451545.0
    static let julianDaysFromUnixEpochToJ2000 = Double.julianDateAtJ2000 - Double.julianDateAtUnixEpoch
}

extension Second {
  static let perJulianDay = 86400.0
}
