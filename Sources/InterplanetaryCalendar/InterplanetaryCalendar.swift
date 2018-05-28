//
//  InterplanetaryCalendar.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

struct InterplanetaryCalendar : Hashable, Equatable {
  public enum Identifier {
    case julian
    case martian
  }

  var identifier: Identifier
  var locale: Locale?
  var timeZone: TimeZone?
  var firstWeekday: Int?
  var hashValue: Int {
    return identifier.hashValue
  }

  init(identifier: Identifier) {
    self.identifier = identifier
  }
}
