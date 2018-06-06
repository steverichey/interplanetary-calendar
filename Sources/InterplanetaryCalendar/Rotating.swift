//
//  Rotating.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

protocol Rotating {
  var rotationalVelocity: KilometerPerSecond { get }
}

extension Rotating where Self: Circular {
  // equivalent to days
  var siderealRotationPeriod: Second {
    return meanCircumference / rotationalVelocity
  }
}
