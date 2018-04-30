//
//  Planet.swift
//  MarsCalendar
//
//  Created by ad laos on 4/26/18.
//  Copyright © 2018 STVR. All rights reserved.
//

import Foundation

enum Planet: Body, Ellipsoid, Rotating, Orbiting {
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
            return mass_mercury
        case .venus:
            return mass_venus
        case .earth:
            return mass_earth
        case .mars:
            return mass_mars
        case .jupiter:
            return mass_jupiter
        case .saturn:
            return mass_saturn
        case .uranus:
            return mass_uranus
        case .neptune:
            return mass_neptune
        }
    }

    var equatorialRadius: Kilometer {
        switch self {
        case .mercury:
            return radius_mercury
        case .venus:
            return radius_venus
        case .earth:
            return earth_wgs80_equatorial_radius
        case .mars:
            return radius_mars
        case .jupiter:
            return radius_jupiter
        case .saturn:
            return radius_saturn
        case .uranus:
            return radius_uranus
        case .neptune:
            return radius_neptune
        }
    }

    var flattening: Double {
        switch self {
        case .earth:
            return 1 / earth_wgs80_inverse_flattening
        default:
            return 0
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

    var secondsPerSolarDay: Second? {
        switch self {
        case .earth:
            return seconds_per_julian_day
        case .mars:
            return seconds_per_martian_solar_day
        // other planets do not yet have solar days defined
        default:
            return nil
        }
    }
}
