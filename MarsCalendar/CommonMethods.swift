//
//  CommonMethods.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
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
