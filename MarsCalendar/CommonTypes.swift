//
//  CommonTypes.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

protocol MetricUnit {
    var rawValue: Double { get }
    init(_ value: Double)
}

extension MetricUnit {
    static func * <S: Squared> (left: Self, right: Self) -> S {
        return SquaredImpl(left.rawValue * right.rawValue)
    }

    static func * (left: Self, right: Double) -> Self {
        return Self(left.rawValue * right)
    }

    static func / (left: Self, right: Self) -> Double {
        return left.rawValue / right.rawValue
    }

    static func / <T, F: Fraction> (left: Self, right: F) -> T where F.Denominator == T {
        return T(left.rawValue / right.rawValue)
    }

    static func / (left: Self, right: Double) -> Self {
        return Self(left.rawValue / right)
    }

    static func / <T, F: Fraction> (left: Self, right: T) -> F where F.Denominator == T {
        return MetricUnitFraction(left.rawValue / right.rawValue)
    }

    static func + (left: Self, right: Self) -> Self {
        return Self(left.rawValue + right.rawValue)
    }

    static func - (left: Self, right: Self) -> Self {
        return Self(left.rawValue - right.rawValue)
    }
}

// Fraction<Cubed<T1>, Squared<T2>>'
// *
// Cubed<T1>

struct Meter: MetricUnit {
    let rawValue: Double
    init(_ value: Double) { rawValue = value }
}

struct Gram: MetricUnit {
    let rawValue: Double
    init(_ value: Double) { rawValue = value }
}

struct Second: MetricUnit {
    let rawValue: Double
    init(_ value: Double) { rawValue = value }
}

protocol Squared: MetricUnit {
    associatedtype Unit: MetricUnit
}

extension Squared {
    static func * <C: Cubed & MetricUnit> (left: Self, right: Self.Unit) -> C where C.Unit == Self.Unit { //where C.Unit == Self.Unit {
        return MetricUnitCubed(left.rawValue * right.rawValue)
    }

    static func / (left: Self, right: Self.Unit) -> MetricUnit {
        return Self.Unit(left.rawValue / right.rawValue)
    }
}

protocol Cubed: MetricUnit {
    associatedtype Unit: MetricUnit
}

extension Cubed {
    static func / <S: Squared> (left: Self, right: Unit) -> S {
        return S(left.rawValue / right.rawValue)
    }
}

struct MetricUnitSquared<T: MetricUnit>: MetricUnit, Squared {
    typealias Unit = T
    let rawValue: Double
    init(_ value: Double) { rawValue = value }
}

struct MetricUnitCubed<T: MetricUnit>: MetricUnit, Cubed {
    typealias Unit = T
    let rawValue: Double
    init(_ value: Double) { rawValue = value }
}

protocol Fraction {
    associatedtype Numerator: MetricUnit
    associatedtype Denominator: MetricUnit
}

extension Fraction where Self: MetricUnit {
    static func * (left: Self, right: Self.Numerator) -> Self {
        return Self(left.rawValue * right.rawValue)
    }
}

extension Fraction where Self.Numerator: Squared, Self.Denominator: Squared, Self: MetricUnit {
    func sqrt<F: Fraction & MetricUnit>() -> F where F.Numerator == Self.Numerator.Unit, F.Denominator == Self.Denominator.Unit {
        return MetricUnitFraction(MarsCalendar_iOS.sqrt(rawValue))
    }
}

struct MetricUnitFraction<T1: MetricUnit, T2: MetricUnit>: MetricUnit, Fraction {
    typealias Numerator = T1
    typealias Denominator = T2
    let rawValue: Double
    init(_ value: Double) { rawValue = value }
}

extension Fraction where Self: MetricUnit {
    static func / (lhs: Self, rhs: Denominator) -> Numerator {
        return Numerator(lhs.rawValue / rhs.rawValue)
    }
}

typealias MetersPerSecond = MetricUnitFraction<Meter, Second>
typealias GramsPerCubicMeter = MetricUnitFraction<Gram, MetricUnitCubed<Meter>>

protocol Product {
    associatedtype Factor1: MetricUnit
    associatedtype Factor2: MetricUnit
}

struct ProductImpl<T1: MetricUnit, T2: MetricUnit>: MetricUnit, Product {
    typealias Factor1 = T1
    typealias Factor2 = T2
    let rawValue: Double
    init(_ value: Double) { rawValue = value }
}
