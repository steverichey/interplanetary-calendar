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

    var mass: Kilogram {
        switch self {
        case .mercury:
            return comp_mass_mercury()
        case .venus:
            return comp_mass_venus()
        case .earth:
            return comp_mass_earth()
        case .mars:
            return comp_mass_mars()
        case .jupiter:
            return comp_mass_jupiter()
        case .saturn:
            return comp_mass_saturn()
        case .uranus:
            return comp_mass_uranus()
        case .neptune:
            return comp_mass_neptune()
        }
    }

    var diameter: Kilometer {
        switch self {
        case .mercury:
            return diameter_mercury
        case .venus:
            return diameter_venus
        case .earth:
            return diameter_earth
        case .mars:
            return diameter_mars
        case .jupiter:
            return diameter_jupiter
        case .saturn:
            return diameter_saturn
        case .uranus:
            return diameter_uranus
        case .neptune:
            return diameter_neptune
        }
    }

    var perihelion: Kilometer {
        switch self {
        case .mercury:
            return perihelion_mercury
        case .venus:
            return perihelion_venus
        case .earth:
            return perihelion_earth
        case .mars:
            return perihelion_mars
        case .jupiter:
            return perihelion_jupiter
        case .saturn:
            return perihelion_saturn
        case .uranus:
            return perihelion_uranus
        case .neptune:
            return perihelion_neptune
        }
    }

    var aphelion: Kilometer {
        switch self {
        case .mercury:
            return aphelion_mercury
        case .venus:
            return aphelion_venus
        case .earth:
            return aphelion_earth
        case .mars:
            return aphelion_mars
        case .jupiter:
            return aphelion_jupiter
        case .saturn:
            return aphelion_saturn
        case .uranus:
            return aphelion_uranus
        case .neptune:
            return aphelion_neptune
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

    var rotationalVelocity: KilometerPerSecond { // km/sec
        switch self {
        case .mercury:
            return rotational_velocity_mercury
        case .venus:
            return rotational_velocity_venus
        case .earth:
            return rotational_velocity_earth
        case .mars:
            return rotational_velocity_mars
        case .jupiter:
            return rotational_velocity_jupiter
        case .saturn:
            return rotational_velocity_saturn
        case .uranus:
            return rotational_velocity_uranus
        case .neptune:
            return rotational_velocity_neptune
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
