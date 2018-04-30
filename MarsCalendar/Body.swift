//
//  Body.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Body: HasVolume {
    var mass: Kilogram { get }
}

extension Body {
    var standardGravitationalParameter: CubicKilometerPerSquareSecond {
        return Double.gravitationalConstant * mass
    }

    var density: KilogramPerCubicKilometer {
        return mass / volume
    }
}
