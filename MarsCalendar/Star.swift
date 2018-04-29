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

    var mass: Kilogram {
        switch self {
        case .sun:
            return mass_sun
        }
    }

    var diameter: Kilometer {
        switch self {
        case .sun:
            return diameter_sun
        }
    }

    var rotationalVelocity: KilometerPerSecond {
        switch self {
        case .sun:
            return rotational_velocity_sun
        }
    }
}
