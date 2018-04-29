//
//  Star.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

enum Star: Body, Sphere, Rotating {
    case sun

    var mass: Gram {
        switch self {
        case .sun:
            return Gram(standard(1.988435, tenTo: 30))
        }
    }

    var diameter: Meter {
        switch self {
        case .sun:
            return Meter(standard(1.391, tenTo: 6))
        }
    }

    var rotationalVelocity: UnitFraction<Meter, Second> {
        switch self {
        case .sun:
            return UnitFraction(2.02)
        }
    }

    var standardGravitationalParameter: Double {
        switch self {
        case .sun:
            return standard(1.32712440018, tenTo: 11)
        }
    }
}
