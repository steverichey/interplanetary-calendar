//
//  Moon.swift
//  MarsCalendar-iOS
//
//  Created by ad laos on 4/29/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

enum Moon: Body, Ellipsoid, Rotating, Orbiting {
    case moon

    var mass: Kilogram {
        switch self {
        case .moon:
            return mass_moon
        }
    }

    var rotationalVelocity: KilometerPerSecond {
        switch self {
        case .moon:
            return rotational_velocity_moon
        }
    }

    var perihelion: Kilometer {
        switch self {
        case .moon:
            return perihelion_moon
        }
    }

    var aphelion: Kilometer {
        switch self {
        case .moon:
            return aphelion_moon
        }
    }

    var eccentricity: Double {
        switch self {
        case .moon:
            return eccentricity_moon
        }
    }

    var equatorialRadius: Kilometer {
        switch self {
        case .moon:
            return radius_moon
        }
    }

    var flattening: Double {
        return 0
    }
}
