//
//  Star.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

enum Star: Body, Ellipsoid, Rotating {
    case sun

    var mass: Kilogram {
        switch self {
        case .sun:
            return Mass.sun.rawValue
        }
    }

    var equatorialRadius: Kilometer {
        switch self {
        case .sun:
            return Radius.sun.rawValue
        }
    }

    var flattening: Double {
        switch self {
        case .sun:
            return 0
        }
    }

    var rotationalVelocity: KilometerPerSecond {
        switch self {
        case .sun:
            return RotationalVelocity.sun.rawValue
        }
    }
}
