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
func square<T, S: Squared>(_ value: T) -> S where S.Unit == T {
    return value * value
}

@inline(__always)
func cube<T, C: Cubed>(_ value: T) -> C where C.Unit == T {
    return (value * value) * value
}

@inline(__always)
func sqrt<S: Squared>(_ value: S) -> S.Unit {
    return S.Unit(sqrt(value.rawValue))
}

@inline(__always)
func sqrt<F1: Fraction & MetricUnit, S1: Squared & MetricUnit, S2: Squared & MetricUnit>(_ value: F1) -> Fraction where F1.Numerator == S1, F1.Denominator == S2 {
    return MetricUnitFraction<F1.Numerator.Unit, F1.Denominator.Unit>(sqrt(value.rawValue))
}


extension Fraction where Self: MetricUnit, Self.Numerator: Squared, Self.Denominator: Squared {
}

@inline(__always)
func standard(_ decimal: Double, tenTo power: Double) -> Double {
    return decimal * pow(10, power)
}

@inline(__always)
func average<T: MetricUnit>(_ value1: T, _ value2: T) -> T {
    return (value1 + value2) / 2.0
}
