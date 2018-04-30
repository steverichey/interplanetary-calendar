//
//  Ellipsoid.swift
//  MarsCalendar-iOS
//
//  Created by ad laos on 4/29/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Ellipsoid: HasVolume, Circular {
    var equatorialRadius: Kilometer { get }
    var flattening: Double { get }
}

extension Ellipsoid {
    var inverseFlattening: Double {
        return 1 / flattening
    }

    var meanRadius: Kilometer {
        return (2.0 * equatorialRadius + polarRadius) / 3.0
    }

    var polarRadius: Kilometer {
        return equatorialRadius * (1 - flattening)
    }

    var volume: CubicKilometer {
        return (4.0 / 3.0) * Double.pi * equatorialRadius * equatorialRadius * polarRadius
    }

    var equatorialCircumference: Kilometer {
        return equatorialRadius * Double.tau
    }

    var meanCircumference: Kilometer {
        return meanRadius * Double.tau
    }

    var polarCircumference: Kilometer {
        return polarRadius * Double.tau
    }
}
