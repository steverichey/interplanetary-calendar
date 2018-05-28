//
//  XCTAssert+Extensions.swift
//  MarsCalendarTests
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation
import XCTest

func XCTAssertNotNan(_ expression: @autoclosure () -> Double, file: StaticString = #file, line: UInt = #line) {
  if expression().isNaN {
    XCTFail("expression is nan", file: file, line: line)
  }
}

func XCTAssertPow(_ expression1: @autoclosure () -> Double, _ expression2: @autoclosure () -> UInt, file: StaticString = #file, line: UInt = #line) {
  if UInt(expression1().description.split(separator: "+")[1]) != expression2() {
    XCTFail("Value is not raised to power \(expression2())", file: file, line: line)
  }
}

func XCTAssertEqual(_ expression1: @autoclosure () -> Double, _ expression2: @autoclosure () -> Double, percentAccuracy: @autoclosure () -> Double, file: StaticString = #file, line: UInt = #line) {
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
