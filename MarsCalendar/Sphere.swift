//
//  Sphere.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Sphere: Circular {
}

extension Sphere {
    var volume: CubicKilometer {
        return cube(meanRadius) * (4 / 3) * Double.pi
    }
}
