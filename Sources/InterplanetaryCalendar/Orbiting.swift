//
//  Orbiting.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

protocol Orbiting {
  // the closest distance to the body around which this is orbiting
  var perihelion: Kilometer { get }

  // the furthest distance to the body around which this is orbiting
  var aphelion: Kilometer { get }

  // how much the orbit deviates from a perfect circle
  var eccentricity: Double { get }
}

extension Orbiting where Self: Body {
  func orbitalPeriod(around body: Body) -> Second {
    return Double.tau * sqrt(cube(semiMajorAxis) / body.standardGravitationalParameter)
  }

  var semiMinorAxis: Kilometer {
    return semiMajorAxis * sqrt(1.0 - square(eccentricity))
  }

  var semiMajorAxis: Kilometer {
    return average(aphelion, perihelion)
  }

  // this is usually only valid when the other body is much larger, so we restrict this to stars for now
  func meanOrbitalVelocity(around star: Star) -> KilometerPerSecond {
    return sqrt(star.standardGravitationalParameter / semiMajorAxis)
  }

  func orbitalVelocity(at distance: Kilometer, from body: Body) -> KilometerPerSecond {
    return sqrt(body.standardGravitationalParameter * ((2.0 / distance) - (1.0 / semiMajorAxis)))
  }
}
