//
//  Constants.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

extension Double {
    // in km^3 / kg * sec^2
    static var gravitationalConstant: UnitFraction<Cubed<Meter>, Product<Gram, Squared<Second>>> {
        return UnitFraction(universal_gravitational_constant)
    }

    static let tau = M_TAU
}
