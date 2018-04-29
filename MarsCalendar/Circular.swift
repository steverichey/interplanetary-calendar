//
//  Circular.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol Circular {
    var diameter: Meter { get }
}

extension Circular {
    var radius: Meter {
        return diameter / 2.0
    }

    var circumference: Meter {
        return radius * Double.tau
    }
}
