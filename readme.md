# InterplanetaryCalendar [![Build Status](https://travis-ci.org/steverichey/interplanetary-calendar.svg?branch=master)](https://travis-ci.org/steverichey/interplanetary-calendar)

Adds support to calendars using non-geocentric reference points. This is still a work-in-progress and is not complete.

## About

The Foundation calendar makes a number of assumptions about reference points in its calendar implementation. Namely, it assumes coordinated universal time using the Unix epoch and earth days. However, this may not be suitable for applications which are designed for use on other planets.

This repository serves to fill this obvious oversight in the Foundation implementation. Furthermore, the hope is that this will serve as a stepping stone to providing support for non-earth calendars in other popular languages such as COBOL. Currently, much of the data (eccentricity values, leap seconds) is hard-coded into the source, but a goal of this project is to abstract these into data files that could be parsed during a build process for any target platform.

# Status

Currently, there is some limited functionality available. For example, the default Foundation implementation of a time interval for a date is commonly as follows:

```swift
Date().timeIntervalSince1970
```

However, in order to make this more accurate, and expand it to additional epochs and so on, this project adds the following:

```swift
// identical to the previous
Date().timeIntervalSince(epoch: .unix, timeStandard: .coordinatedUniversal)
// terrestrial seconds since the julian epoch
Date().timeIntervalSince(epoch: .julian, timeStandard: .terrestrial)
```

Determination of the terrestrial Julian date is a common first step in calculating the date on other planets. It's also possible to get the martian solar date directly:

```swift
Date().martianSolDate
```

Note that all API is a very early work in progress and subject to change at any time and is probably broken right now.

# Todo

- [ ] Live interplanetary clock in browser (for now, see [http://jtauber.github.io/mars-clock/](here))
- [ ] Support for Swatch internet time [https://en.wikipedia.org/wiki/Swatch_Internet_Time](see here)
- [ ] Support for leap second smearing
- [ ] Differentiate between sidereal and solar days for all planets; automatic computation of both based on orbital and rotational velocity
- [ ] Protocol conformance for Foundation Calendar classes

## License

All content in this repository is shared under an MIT license. See [license.md](./license.md) for details.
