//
//  LeapSecond.swift
//  InterplanetaryCalendar
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import Foundation

/**
 Whether a specified leap second is rolling or stationary.
 */
enum Correction {
  // If the leapsecond is Rolling (R) the given time is local time.
  case rolling
  // If the leapsecond is Stationary (S) the given time is UTC.
  case stationary
}

/**
 Storage for a single leap second.
 Most of the constants here are from ftp://ftp.nist.gov/pub/time/leap-seconds.list
 todo: automate the process of updating the leap second list
 */
struct LeapSecond {
  // when the leap second was added
  let date: Date
  // the amount of the leap second (so far, they're all one second)
  let amount: Second
  // whether this was a rolling or stationary leap second
  let correction: Correction

  init(date: Date, amount: Second = 1, correction: Correction = .stationary) {
    self.date = date
    self.amount = amount
    self.correction = correction
  }

  // todo: add support for smearing seconds
  static func before(date: Date) -> Second {
    return all.filter { date > $0.date }.reduce(0, { $0 + $1.amount })
  }

  // todo: add support for smearing seconds
  static func from(_ date: Date, to toDate: Date) -> Second {
    return all.filter { $0.date > date && $0.date < toDate }.reduce(0, { $0 + $1.amount })
  }

  // todo: add support for smearing seconds
  static func after(date: Date) -> Second {
    return all.filter { date < $0.date }.reduce(0, { $0 + $1.amount })
  }

  static var total: Second {
    return all.reduce(0, { $0 + $1.amount })
  }

  // todo: automatically generate these from data files
  static let all = [
    // 2272060800	10	# 1 Jan 1972
    LeapSecond(date: Date(timeInterval: 2272060800.0, since: .networkTimeProtocol), amount: 10.0),
    // 2287785600	11	# 1 Jul 1972
    LeapSecond(date: Date(timeInterval: 2287785600.0, since: .networkTimeProtocol)),
    // 2303683200	12	# 1 Jan 1973
    LeapSecond(date: Date(timeInterval: 2303683200.0, since: .networkTimeProtocol)),
    // 2335219200	13	# 1 Jan 1974
    LeapSecond(date: Date(timeInterval: 2335219200.0, since: .networkTimeProtocol)),
    // 2366755200	14	# 1 Jan 1975
    LeapSecond(date: Date(timeInterval: 2366755200.0, since: .networkTimeProtocol)),
    // 2398291200	15	# 1 Jan 1976
    LeapSecond(date: Date(timeInterval: 2398291200.0, since: .networkTimeProtocol)),
    // 2429913600	16	# 1 Jan 1977
    LeapSecond(date: Date(timeInterval: 2429913600.0, since: .networkTimeProtocol)),
    // 2461449600	17	# 1 Jan 1978
    LeapSecond(date: Date(timeInterval: 2461449600.0, since: .networkTimeProtocol)),
    // 2492985600	18	# 1 Jan 1979
    LeapSecond(date: Date(timeInterval: 2492985600.0, since: .networkTimeProtocol)),
    // 2524521600	19	# 1 Jan 1980
    LeapSecond(date: Date(timeInterval: 2524521600.0, since: .networkTimeProtocol)),
    // 2571782400	20	# 1 Jul 1981
    LeapSecond(date: Date(timeInterval: 2571782400.0, since: .networkTimeProtocol)),
    // 2603318400	21	# 1 Jul 1982
    LeapSecond(date: Date(timeInterval: 2603318400.0, since: .networkTimeProtocol)),
    // 2634854400	22	# 1 Jul 1983
    LeapSecond(date: Date(timeInterval: 2634854400.0, since: .networkTimeProtocol)),
    // 2698012800	23	# 1 Jul 1985
    LeapSecond(date: Date(timeInterval: 2698012800.0, since: .networkTimeProtocol)),
    // 2776982400	24	# 1 Jan 1988
    LeapSecond(date: Date(timeInterval: 2776982400.0, since: .networkTimeProtocol)),
    // 2840140800	25	# 1 Jan 1990
    LeapSecond(date: Date(timeInterval: 2840140800.0, since: .networkTimeProtocol)),
    // 2871676800	26	# 1 Jan 1991
    LeapSecond(date: Date(timeInterval: 2871676800.0, since: .networkTimeProtocol)),
    // 2918937600	27	# 1 Jul 1992
    LeapSecond(date: Date(timeInterval: 2918937600.0, since: .networkTimeProtocol)),
    // 2950473600	28	# 1 Jul 1993
    LeapSecond(date: Date(timeInterval: 2950473600.0, since: .networkTimeProtocol)),
    // 2982009600	29	# 1 Jul 1994
    LeapSecond(date: Date(timeInterval: 2982009600.0, since: .networkTimeProtocol)),
    // 3029443200	30	# 1 Jan 1996
    LeapSecond(date: Date(timeInterval: 3029443200.0, since: .networkTimeProtocol)),
    // 3076704000	31	# 1 Jul 1997
    LeapSecond(date: Date(timeInterval: 3076704000.0, since: .networkTimeProtocol)),
    // 3124137600	32	# 1 Jan 1999
    LeapSecond(date: Date(timeInterval: 3124137600.0, since: .networkTimeProtocol)),
    // 3345062400	33	# 1 Jan 2006
    LeapSecond(date: Date(timeInterval: 3345062400.0, since: .networkTimeProtocol)),
    // 3439756800	34	# 1 Jan 2009
    LeapSecond(date: Date(timeInterval: 3439756800.0, since: .networkTimeProtocol)),
    // 3550089600	35	# 1 Jul 2012
    LeapSecond(date: Date(timeInterval: 3550089600.0, since: .networkTimeProtocol)),
    // 3644697600	36	# 1 Jul 2015
    LeapSecond(date: Date(timeInterval: 3644697600.0, since: .networkTimeProtocol)),
    // 3692217600	37	# 1 Jan 2017
    LeapSecond(date: Date(timeInterval: 3692217600.0, since: .networkTimeProtocol)),
  ]
}
