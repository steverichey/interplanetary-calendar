//
//  Constants.h
//  MarsCalendar
//
//  Created by ad laos on 4/28/18.
//  Copyright © 2018 STVR. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

// todo: we only need pow(), do we need math.h?
#import <math.h>

#define SCI(a,b) a * pow(10,b)

#define universal_gravitational_constant 0.0000000000000000000667408
#define M_TAU 6.28318530717958647692

#define diameter_mercury   4879.40
#define diameter_venus    12104.00
#define diameter_earth    12742.02
#define diameter_mars      6779.00
#define diameter_jupiter 139820.00
#define diameter_saturn  116460.00
#define diameter_uranus   50724.00
#define diameter_neptune  49244.00

// todo: is there a way to #define these instead?
const static inline double comp_mass_mercury() { return SCI(3.3010400, 23); }
const static inline double comp_mass_venus()   { return SCI(4.8673200, 24); }
const static inline double comp_mass_earth()   { return SCI(5.9721986, 24); }
const static inline double comp_mass_mars()    { return SCI(6.4169300, 23); }
const static inline double comp_mass_jupiter() { return SCI(1.8981300, 27); }
const static inline double comp_mass_saturn()  { return SCI(5.6831900, 26); }
const static inline double comp_mass_uranus()  { return SCI(8.6810300, 25); }
const static inline double comp_mass_neptune() { return SCI(1.0241000, 26); }

#define perihelion_mercury   46001200.0
#define perihelion_venus    107471000.0
#define perihelion_earth    147098074.0
#define perihelion_mars     206644545.0
#define perihelion_jupiter  740742600.0
#define perihelion_saturn  1349467000.0
#define perihelion_uranus  2735555030.0
#define perihelion_neptune 4459631500.0

#define aphelion_mercury     69816900.0
#define aphelion_venus      108939000.0
#define aphelion_earth      152097701.0
#define aphelion_mars       249228730.0
#define aphelion_jupiter    816081460.0
#define aphelion_saturn    1503983000.0
#define aphelion_uranus    3006389400.0
#define aphelion_neptune   4536874300.0

#define eccentricity_mercury  0.20563069
#define eccentricity_venus    0.00677323
#define eccentricity_earth    0.01671022
#define eccentricity_mars     0.09341233
#define eccentricity_jupiter  0.04839266
#define eccentricity_saturn   0.05415060
#define eccentricity_uranus   0.04716771
#define eccentricity_neptune  0.00858587

#define rotational_velocity_mercury   0.0030253
#define rotational_velocity_venus     0.0018110
#define rotational_velocity_earth     0.4651000
#define rotational_velocity_mars      0.2407300
#define rotational_velocity_jupiter  12.5720000
#define rotational_velocity_saturn    9.8710000
#define rotational_velocity_uranus    2.5875000
#define rotational_velocity_neptune   2.6829000

#endif /* Constants_h */
