//
//  XCTAssert+Extensions.swift
//  InterplanetaryCalendarTests
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation
import XCTest

/// Causes an XCTest failure if the given expression returns NaN.
/// - parameter expression: The autoclosed expression to evaluate.
func XCTAssertNotNan(_ expression: @autoclosure () -> Double,
                     file: StaticString = #file,
                     line: UInt = #line) {
  if expression().isNaN {
    XCTFail("expression is nan", file: file, line: line)
  }
}

/// Verifies that the first expression evaluates to a value that is raised by the second.
/// - parameter expression1: The expression to evaluate for the number to check.
/// - parameter expression2: The expression to evaulate for the proper power.
func XCTAssertPow(_ expression1: @autoclosure () -> Double,
                  _ expression2: @autoclosure () -> UInt,
                  file: StaticString = #file,
                  line: UInt = #line) {
  if UInt(expression1().description.split(separator: "+")[1]) != expression2() {
    XCTFail("Value is not raised to power \(expression2())", file: file, line: line)
  }
}

/// Instead of looking for an constant epsilon difference range between two values, check for a percent accuracy.
/// - parameter expression1: The first expression to check.
/// - parameter expression2: The second expression to check.
/// - parameter percentAccuracy: The percentage difference that the second value must evaluate to compared to the first expression.
func XCTAssertEqual(_ expression1: @autoclosure () -> Double,
                    _ expression2: @autoclosure () -> Double,
                    percentAccuracy: @autoclosure () -> Double,
                    file: StaticString = #file,
                    line: UInt = #line) {
  let lhs = expression1()
  let rhs = expression2()
  let per = percentAccuracy()

  if lhs < rhs * (1 - per) {
    XCTFail("\(lhs) is not greater than \(rhs) - \(per)%", file: file, line: line)
  }

  if lhs > rhs * (1 + per) {
    XCTFail("\(lhs) is not less than \(rhs) + \(per)%", file: file, line: line)
  }
}
