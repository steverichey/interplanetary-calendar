//
//  Array+Extensions.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

extension Array {
  subscript (optional index: Int) -> Element? {
      return indices ~= index ? self[index] : nil
  }
}
