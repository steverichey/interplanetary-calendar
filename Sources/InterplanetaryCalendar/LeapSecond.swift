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
    return Double(all.count)
  }

  // todo: update these to use NTP epoch timestamps
  // 2272060800  10  # 1 Jan 1972
  // 2287785600  11  # 1 Jul 1972
  // 2303683200  12  # 1 Jan 1973
  // 2335219200  13  # 1 Jan 1974
  // 2366755200  14  # 1 Jan 1975
  // 2398291200  15  # 1 Jan 1976
  // 2429913600  16  # 1 Jan 1977
  // 2461449600  17  # 1 Jan 1978
  // 2492985600  18  # 1 Jan 1979
  // 2524521600  19  # 1 Jan 1980
  // 2571782400  20  # 1 Jul 1981
  // 2603318400  21  # 1 Jul 1982
  // 2634854400  22  # 1 Jul 1983
  // 2698012800  23  # 1 Jul 1985
  // 2776982400  24  # 1 Jan 1988
  // 2840140800  25  # 1 Jan 1990
  // 2871676800  26  # 1 Jan 1991
  // 2918937600  27  # 1 Jul 1992
  // 2950473600  28  # 1 Jul 1993
  // 2982009600  29  # 1 Jul 1994
  // 3029443200  30  # 1 Jan 1996
  // 3076704000  31  # 1 Jul 1997
  // 3124137600  32  # 1 Jan 1999
  // 3345062400  33  # 1 Jan 2006
  // 3439756800  34  # 1 Jan 2009
  // 3550089600  35  # 1 Jul 2012
  // 3644697600  36  # 1 Jul 2015
  // 3692217600  37  # 1 Jan 2017

  static let all = [
    // Leap  1972  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 78814800.0)),
    // Leap  1972  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 94716000.0)),
    // Leap  1973  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 126252000.0)),
    // Leap  1974  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 157788000.0)),
    // Leap  1975  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 189324000.0)),
    // Leap  1976  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 220946400.0)),
    // Leap  1977  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 252482400.0)),
    // Leap  1978  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 284018400.0)),
    // Leap  1979  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 315554400.0)),
    // Leap  1981  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 362811600.0)),
    // Leap  1982  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 394347600.0)),
    // Leap  1983  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 425883600.0)),
    // Leap  1985  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 489042000.0)),
    // Leap  1987  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 568015200.0)),
    // Leap  1989  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 631173600.0)),
    // Leap  1990  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 662709600.0)),
    // Leap  1992  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 709966800.0)),
    // Leap  1993  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 741502800.0)),
    // Leap  1994  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 773038800.0)),
    // Leap  1995  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 820476000.0)),
    // Leap  1997  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 867733200.0)),
    // Leap  1998  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 915170400.0)),
    // Leap  2005  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 1136095200.0)),
    // Leap  2008  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 1230789600.0)),
    // Leap  2012  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 1341118800.0)),
    // Leap  2015  Jun  30  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 1435726800.0)),
    // Leap  2016  Dec  31  23:59:60  +  S
    LeapSecond(date: Date(timeIntervalSince1970: 1483250400.0))
  ]
}
