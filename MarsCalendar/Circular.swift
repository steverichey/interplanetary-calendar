//
//  Circular.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
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
