//
//  Circular.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

protocol Circular {
    var meanRadius: Kilometer { get }
}

extension Circular {
    var meanDiameter: Kilometer {
        return meanRadius * 2.0
    }

    var meanCircumference: Kilometer {
        return meanRadius * Double.tau
    }
}
