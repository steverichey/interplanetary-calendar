//
//  Circular.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Circular {
    var diameter: Kilometer { get }
}

extension Circular {
    var radius: Kilometer {
        return diameter / 2.0
    }

    var circumference: Kilometer {
        return radius * Double.tau
    }
}
