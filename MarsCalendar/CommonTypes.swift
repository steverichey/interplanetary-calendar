//
//  CommonTypes.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

typealias Kilometer = Double
typealias CubicKilometer = Double
typealias Second = TimeInterval
typealias Day = Double
typealias KilometerPerSecond = Double
typealias Kilogram = Double
typealias KilogramPerCubicKilometer = Double
typealias CubicKilometerPerKilogramSquareSecond = Double
typealias CubicKilometerPerSquareSecond = Double

extension Second {
    // convert a time interval in seconds to a type of day scale
    func convertTo(days: DayScale) -> Day {
        return self / days.length
    }
}
