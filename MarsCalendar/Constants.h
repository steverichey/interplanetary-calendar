//
//  Constants.h
//  MarsCalendar
//
//  Created by ad laos on 4/28/18.
//  Copyright © 2018 STVR. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define universal_gravitational_constant 6.67408E-20 // km^3 / kg * s^2
#define M_TAU 6.28318530717958647692
#define speed_of_light 299792.458 // km/s
#define astrononical_unit 149597870.700 // km
#define seconds_per_julian_day 86400.0
#define milliseconds_per_julian_day 86400000.0
#define julian_date_at_unix_epoch 2440587.5
#define julian_date_at_j2000 2451545.0
// the difference between TAI and UTC
#define tai_offset 37
#define total_julian_leap_seconds 69.184
#define julian_date_at_martian_prime_meridian_midnight_after_j2000 4.5
#define seconds_per_martian_solar_day 88775.244

// km
#define radius_mercury   2439.7
#define radius_venus     6052.0
#define radius_mars      3389.5
#define radius_jupiter  69910.0
#define radius_saturn   58230.0
#define radius_uranus   25362.0
#define radius_neptune  24622.0
#define radius_sun     695508.0
#define radius_moon      1737.4

// kg
#define mass_mercury 3.3010400E23
#define mass_venus   4.8673200E24
#define mass_earth   5.9721986E24
#define mass_mars    6.4169300E23
#define mass_jupiter 1.8981300E27
#define mass_saturn  5.6831900E26
#define mass_uranus  8.6810300E25
#define mass_neptune 1.0241000E26
#define mass_sun     1.9884350E30
#define mass_moon    7.3459000E22

// km
#define perihelion_mercury   46001200.0
#define perihelion_venus    107471000.0
#define perihelion_earth    147098074.0
#define perihelion_mars     206644545.0
#define perihelion_jupiter  740742600.0
#define perihelion_saturn  1349467000.0
#define perihelion_uranus  2735555030.0
#define perihelion_neptune 4459631500.0
#define perihelion_moon        359000.0

// km
#define aphelion_mercury     69816900.0
#define aphelion_venus      108939000.0
#define aphelion_earth      152097701.0
#define aphelion_mars       249228730.0
#define aphelion_jupiter    816081460.0
#define aphelion_saturn    1503983000.0
#define aphelion_uranus    3006389400.0
#define aphelion_neptune   4536874300.0
#define aphelion_moon          405000.0

#define eccentricity_mercury  0.20563069
#define eccentricity_venus    0.00677323
#define eccentricity_earth    0.01671022
#define eccentricity_mars     0.09341233
#define eccentricity_jupiter  0.04839266
#define eccentricity_saturn   0.05415060
#define eccentricity_uranus   0.04716771
#define eccentricity_neptune  0.00858587
#define eccentricity_moon     0.05490000

// km/s
#define rotational_velocity_mercury   0.0030253
#define rotational_velocity_venus     0.0018110
#define rotational_velocity_earth     0.4651000
#define rotational_velocity_mars      0.2407300
#define rotational_velocity_jupiter  12.5720000
#define rotational_velocity_saturn    9.8710000
#define rotational_velocity_uranus    2.5875000
#define rotational_velocity_neptune   2.6829000
#define rotational_velocity_sun       2.0200000
#define rotational_velocity_moon      1.0220000

// ellipsoid info
#define earth_wgs80_equatorial_radius   6378.137000000
#define earth_wgs80_inverse_flattening   298.257223563

#endif /* Constants_h */
