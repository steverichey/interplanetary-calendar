//
//  Body.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Body {
    var mass: Gram { get }
    var density: GramsPerCubicMeter { get }
     // km^3 / s^2
    var standardGravitationalParameter: MetricUnitFraction<MetricUnitCubed<Meter>, MetricUnitSquared<Second>> { get }
}

extension Body {
    var standardGravitationalParameter: MetricUnitFraction<MetricUnitCubed<Meter>, MetricUnitSquared<Second>> {
        return Double.gravitationalConstant * mass
    }
}

extension Body where Self: Sphere {
    var density: GramsPerCubicMeter {
        return mass / volume
    }
}
