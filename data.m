%denna fil innehåller data om planeterna och månarna

%* Planeter
planets   = {'mercury', 'venus', 'earth', 'mars', 'jupiter', 'saturn', 'uranus', 'neptune', 'pluto'};
masses    = [0.33,      4.87,    5.97,    0.642,  1898,      568,      86.8,     102,       0.0146] * 10^24; % (kg)
radius    = [2439.5,    6052,    6378,    3396,   71492,     60268,    25559,    24762,     1182]; % (km)
orbRadius = [57.9,      108.2,   146.6,   227.9,  778.6,     1433.5,   2872.5,   4495.1,    5906.4] * 10^6; % (km)
orbTime   = [88,        224.7,   365.2,   687,    4331,      10747,    30589,    59800,     90560]; % Jorddagar

%* Maps för planeter
P_Masses = containers.Map(planets, masses);
P_Radius = containers.Map(planets, radius);
P_OrbRadius = containers.Map(planets, orbRadius);
P_OrbTimes = containers.Map(planets, orbTime);
clear masses radius orbRadius orbTime;

%* månar
moons = {'moon','phobos','ganymedes','titan','titania','triton','charon'};
masses = [0.07342*10^24, 1.07*10^16, 1.4819*10^23, 1.3452*10^23, 3.527*10^21, 2.147*10^22, 1.52*10^21]; %(kg)
radius = [1737.1, 11.1, 2634.1, 2576, 788.4, 1353.4, 606]; %(km)
orbRadius = [384400, 9376, 1070400, 1221870, 435910, 354800, 19571]; %(km)
orbTime = [27.3216, 0.3189, 7.1545, 15.945, 8.7062, 5.877, 6.3872]; %(dygn)

%* Maps för månar
M_Masses = containers.Map(moons,masses);
M_Radius = containers.Map(moons,radius);
M_OrbRadius = containers.Map(moons,orbRadius);
M_OrbTimes = containers.Map(moons,orbTime);
clear masses radius orbRadius orbTime;
