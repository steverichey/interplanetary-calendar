//
//  Planet.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

private let seconds_per_julian_day = 86400.0
private let seconds_per_martian_solar_day = 88775.244

enum Planet: Body, Ellipsoid, Rotating, Orbiting {
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    // case pluto

    var mass: Kilogram {
        switch self {
        case .mercury:
            return Mass.mercury.rawValue
        case .venus:
            return Mass.venus.rawValue
        case .earth:
            return Mass.earth.rawValue
        case .mars:
            return Mass.mars.rawValue
        case .jupiter:
            return Mass.jupiter.rawValue
        case .saturn:
            return Mass.saturn.rawValue
        case .uranus:
            return Mass.uranus.rawValue
        case .neptune:
            return Mass.neptune.rawValue
        }
    }

    var equatorialRadius: Kilometer {
        switch self {
        case .mercury:
            return Radius.mercury.rawValue
        case .venus:
            return Radius.venus.rawValue
        case .earth:
            return 6378.137000000
        case .mars:
            return Radius.mars.rawValue
        case .jupiter:
            return Radius.jupiter.rawValue
        case .saturn:
            return Radius.saturn.rawValue
        case .uranus:
            return Radius.uranus.rawValue
        case .neptune:
            return Radius.neptune.rawValue
        }
    }

    var flattening: Double {
        switch self {
        case .earth:
            return 1 / 298.257223563
        default:
            return 0
        }
    }

    var perihelion: Kilometer {
        switch self {
        case .mercury:
            return Perihelion.mercury.rawValue
        case .venus:
            return Perihelion.venus.rawValue
        case .earth:
            return Perihelion.earth.rawValue
        case .mars:
            return Perihelion.mars.rawValue
        case .jupiter:
            return Perihelion.jupiter.rawValue
        case .saturn:
            return Perihelion.saturn.rawValue
        case .uranus:
            return Perihelion.uranus.rawValue
        case .neptune:
            return Perihelion.neptune.rawValue
        }
    }

    var aphelion: Kilometer {
        switch self {
        case .mercury:
            return Aphelion.mercury.rawValue
        case .venus:
            return Aphelion.venus.rawValue
        case .earth:
            return Aphelion.earth.rawValue
        case .mars:
            return Aphelion.mars.rawValue
        case .jupiter:
            return Aphelion.jupiter.rawValue
        case .saturn:
            return Aphelion.saturn.rawValue
        case .uranus:
            return Aphelion.uranus.rawValue
        case .neptune:
            return Aphelion.neptune.rawValue
        }
    }

    var eccentricity: Double { // no units
        switch self {
        case .mercury:
            return Eccentricity.mercury.rawValue
        case .venus:
            return Eccentricity.venus.rawValue
        case .earth:
            return Eccentricity.earth.rawValue
        case .mars:
            return Eccentricity.mars.rawValue
        case .jupiter:
            return Eccentricity.jupiter.rawValue
        case .saturn:
            return Eccentricity.saturn.rawValue
        case .uranus:
            return Eccentricity.uranus.rawValue
        case .neptune:
            return Eccentricity.neptune.rawValue
        }
    }

    var rotationalVelocity: KilometerPerSecond { // km/sec
        switch self {
        case .mercury:
            return RotationalVelocity.mercury.rawValue
        case .venus:
            return RotationalVelocity.venus.rawValue
        case .earth:
            return RotationalVelocity.earth.rawValue
        case .mars:
            return RotationalVelocity.mars.rawValue
        case .jupiter:
            return RotationalVelocity.jupiter.rawValue
        case .saturn:
            return RotationalVelocity.saturn.rawValue
        case .uranus:
            return RotationalVelocity.uranus.rawValue
        case .neptune:
            return RotationalVelocity.neptune.rawValue
        }
    }

    var secondsPerSolarDay: Second {
        switch self {
        case .earth:
            return seconds_per_julian_day
        case .mars:
            return seconds_per_martian_solar_day
        // todo: other planets do not yet have solar days defined
        default:
            return 0
        }
    }
}
