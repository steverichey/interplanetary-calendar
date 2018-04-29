//
//  Planet.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

enum Planet: Body, Sphere, Rotating, Orbiting {
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    // case pluto

    var mass: Gram {
        switch self {
        case .mercury:
            return Gram(comp_mass_mercury())
        case .venus:
            return Gram(comp_mass_venus())
        case .earth:
            return Gram(comp_mass_earth())
        case .mars:
            return Gram(comp_mass_mars())
        case .jupiter:
            return Gram(comp_mass_jupiter())
        case .saturn:
            return Gram(comp_mass_saturn())
        case .uranus:
            return Gram(comp_mass_uranus())
        case .neptune:
            return Gram(comp_mass_neptune())
        }
    }

    var diameter: Meter {
        switch self {
        case .mercury:
            return Meter(diameter_mercury)
        case .venus:
            return Meter(diameter_venus)
        case .earth:
            return Meter(diameter_earth)
        case .mars:
            return Meter(diameter_mars)
        case .jupiter:
            return Meter(diameter_jupiter)
        case .saturn:
            return Meter(diameter_saturn)
        case .uranus:
            return Meter(diameter_uranus)
        case .neptune:
            return Meter(diameter_neptune)
        }
    }

    var perihelion: Meter {
        switch self {
        case .mercury:
            return Meter(perihelion_mercury)
        case .venus:
            return Meter(perihelion_venus)
        case .earth:
            return Meter(perihelion_earth)
        case .mars:
            return Meter(perihelion_mars)
        case .jupiter:
            return Meter(perihelion_jupiter)
        case .saturn:
            return Meter(perihelion_saturn)
        case .uranus:
            return Meter(perihelion_uranus)
        case .neptune:
            return Meter(perihelion_neptune)
        }
    }

    var aphelion: Meter {
        switch self {
        case .mercury:
            return Meter(aphelion_mercury)
        case .venus:
            return Meter(aphelion_venus)
        case .earth:
            return Meter(aphelion_earth)
        case .mars:
            return Meter(aphelion_mars)
        case .jupiter:
            return Meter(aphelion_jupiter)
        case .saturn:
            return Meter(aphelion_saturn)
        case .uranus:
            return Meter(aphelion_uranus)
        case .neptune:
            return Meter(aphelion_neptune)
        }
    }

    var eccentricity: Double { // no units
        switch self {
        case .mercury:
            return eccentricity_mercury
        case .venus:
            return eccentricity_venus
        case .earth:
            return eccentricity_earth
        case .mars:
            return eccentricity_mars
        case .jupiter:
            return eccentricity_jupiter
        case .saturn:
            return eccentricity_saturn
        case .uranus:
            return eccentricity_uranus
        case .neptune:
            return eccentricity_neptune
        }
    }

    var rotationalVelocity: MetricUnitFraction<Meter, Second> { // km/sec
        switch self {
        case .mercury:
            return MetricUnitFraction(rotational_velocity_mercury)
        case .venus:
            return MetricUnitFraction(rotational_velocity_venus)
        case .earth:
            return MetricUnitFraction(rotational_velocity_earth)
        case .mars:
            return MetricUnitFraction(rotational_velocity_mars)
        case .jupiter:
            return MetricUnitFraction(rotational_velocity_jupiter)
        case .saturn:
            return MetricUnitFraction(rotational_velocity_saturn)
        case .uranus:
            return MetricUnitFraction(rotational_velocity_uranus)
        case .neptune:
            return MetricUnitFraction(rotational_velocity_neptune)
        }
    }

    var sol: Double {
        switch self {
        case .mercury:
            return siderealRotationPeriod / Planet.earth.siderealRotationPeriod
        case .venus:
            return siderealRotationPeriod / Planet.earth.siderealRotationPeriod
        case .earth:
            return 1
        case .mars:
            return siderealRotationPeriod / Planet.earth.siderealRotationPeriod
        case .jupiter:
            return siderealRotationPeriod / Planet.earth.siderealRotationPeriod
        case .saturn:
            return siderealRotationPeriod / Planet.earth.siderealRotationPeriod
        case .uranus:
            return siderealRotationPeriod / Planet.earth.siderealRotationPeriod
        case .neptune:
            return siderealRotationPeriod / Planet.earth.siderealRotationPeriod
        }
    }
}
