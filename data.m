% Denna fil innehåller data om planeterna och månarna

%* Planeter
planets   = {'mercury', 'venus', 'earth', 'mars', 'jupiter', 'saturn', 'uranus', 'neptune', 'pluto'};
masses    = [0.33,      4.87,    5.97,    0.642,  1898,      568,      86.8,     102,       0.0146] * 10^24; % (kg)
radius    = [2439.5,    6052,    6378,    3396,   71492,     60268,    25559,    24762,     1182]; % (km)
orbRadius = [57.9,      108.2,   146.6,   227.9,  778.6,     1433.5,   2872.5,   4495.1,    5906.4] * 10^6; % (km)
orbTime   = [88,        224.7,   365.2,   687,    4331,      10747,    30589,    59800,     90560]; % Jorddagar

%* Maps för planeter
Masses = containers.Map(planets, masses);
Radius = containers.Map(planets, radius);
OrbRadius = containers.Map(planets, orbRadius);
OrbTimes = containers.Map(planets, orbTime);
clear masses radius orbRadius orbTime;

% TODO: Månar

% TODO: Maps för månar