//
//  Moon.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

enum Moon: Body, Ellipsoid, Rotating, Orbiting {
    case moon

    var mass: Kilogram {
        switch self {
        case .moon:
            return Mass.moon.rawValue
        }
    }

    var rotationalVelocity: KilometerPerSecond {
        switch self {
        case .moon:
            return RotationalVelocity.moon.rawValue
        }
    }

    var perihelion: Kilometer {
        switch self {
        case .moon:
            return Perihelion.moon.rawValue
        }
    }

    var aphelion: Kilometer {
        switch self {
        case .moon:
            return Aphelion.moon.rawValue
        }
    }

    var eccentricity: Double {
        switch self {
        case .moon:
            return Eccentricity.moon.rawValue
        }
    }

    var equatorialRadius: Kilometer {
        switch self {
        case .moon:
            return Radius.moon.rawValue
        }
    }

    var flattening: Double {
        return 0
    }
}
