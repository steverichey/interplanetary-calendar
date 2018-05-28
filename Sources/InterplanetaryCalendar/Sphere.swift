//
//  Sphere.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

protocol Sphere: Circular {
}

extension Sphere {
    var volume: CubicKilometer {
        return cube(meanRadius) * (4 / 3) * Double.pi
    }
}
