//
//  Orbiting.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Orbiting {
    // the closest distance to the body around which this is orbiting
    var perihelion: Meter { get }

    // the furthest distance to the body around which this is orbiting
    var aphelion: Meter { get }

    // how much the orbit deviates from a perfect circle
    var eccentricity: Double { get }
}

extension Orbiting where Self: Body {
    func orbitalPeriod(around body: Body) -> Second {
        let cubedAxis: MetricUnitCubed<Meter> = cube(semiMajorAxis)
        let sgp = body.standardGravitationalParameter
        let product = sgp * cubedAxis
        let root = sqrt(product)
        let prod2 = root * Double.tau
        return prod2
//        return Double.tau * sqrt(cube(semiMajorAxis) / body.standardGravitationalParameter)
    }

    var semiMinorAxis: Meter {
        return semiMajorAxis * sqrt(1.0 - square(eccentricity))
    }

    var semiMajorAxis: Meter {
        return average(aphelion, perihelion)
    }

    // this is usually only valid when the other body is much larger, so we restrict this to stars for now
    func meanOrbitalVelocity<F: Fraction>(around star: Star) -> F where F.Denominator == Meter, F.Numerator == Second {
        return sqrt(star.standardGravitationalParameter / semiMajorAxis)
    }

    func orbitalVelocity(at distance: Meter, from body: Body) -> UnitFraction<Meter, Second> {
        return sqrt(body.standardGravitationalParameter * ((2 / distance) - (1 / semiMajorAxis)))
    }
}
