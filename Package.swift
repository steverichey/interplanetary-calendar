// swift-tools-version:4.0

//
//  Package.swift
//  InterplanetaryCalendarTests
//
//  Copyright 2018 Steve Richey. All rights reserved.
//  See license.md for license information.
//

import PackageDescription

let package = Package(
  name: "InterplanetaryCalendar",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "InterplanetaryCalendar",
      targets: ["InterplanetaryCalendar"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "InterplanetaryCalendar",
      dependencies: []),
    .testTarget(
      name: "InterplanetaryCalendarTests",
      dependencies: ["InterplanetaryCalendar"]),
  ]
)
