//
//  Body.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
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
