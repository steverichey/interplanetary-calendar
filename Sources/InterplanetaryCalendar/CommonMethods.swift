//
//  CommonMethods.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

@inline(__always)
func square(_ value: Double) -> Double {
  return value * value
}

@inline(__always)
func cube(_ value: Double) -> Double {
  return value * value * value
}

@inline(__always)
func average(_ value1: Double, _ value2: Double) -> Double {
  return (value1 + value2) / 2.0
}
