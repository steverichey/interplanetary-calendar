//
//  Body.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Body {
    var mass: Kilogram { get }
    var density: KilogramPerCubicKilometer { get }
}

extension Body {
    var standardGravitationalParameter: CubicKilometerPerSquareSecond {
        return Double.gravitationalConstant * mass
    }
}

extension Body where Self: Sphere {
    var density: KilogramPerCubicKilometer {
        return mass / volume
    }
}
