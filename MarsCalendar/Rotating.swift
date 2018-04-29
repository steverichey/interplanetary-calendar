//
//  Rotating.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Rotating {
    var rotationalVelocity: KilometerPerSecond { get }
}

extension Rotating where Self: Sphere {
    // equivalent to days
    var siderealRotationPeriod: Second {
        return circumference / rotationalVelocity
    }
}
