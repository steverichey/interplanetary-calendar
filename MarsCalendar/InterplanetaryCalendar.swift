//
//  InterplanetaryCalendar.swift
//  MarsCalendar-iOS
//
//  Created by ad laos on 4/30/18.
//  Copyright © 2018 STVR. All rights reserved.
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
