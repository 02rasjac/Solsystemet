%{
    p  = Cell of planets names
    r  = The planets orbital radius
    t  = The planets orbital timeperiod
    pr = The planets radius
    pm = Mass of the planets
    m  = The names of the moons
    mp = The planets the moon orbits
    mr = The moons orbital radius
    mt = The moons orbital timeperiod
%}
function film = Solsystem(p, r, t, pr, m, mp, mr, mt)
    earthDay = 0;
    nDays = 365;

    fig = figure(1);
    fig.Position(1:2) = [100, 100];
    fig.Position(3:4) = [560*2, 420*2];
    while earthDay <= nDays
        clf;
        hold on
        for planet = p
            pName = planet{1};
            
            % Planets orbit
            [x, y] = DrawOrbit(r(pName), t(pName));

            % Planet itself
            [px, py] = PlanetCoord(earthDay, t(pName), x, y);
            DrawBody(pr(pName), px, py);

        end
        hold off
        axis equal
        earthDay = earthDay + 1;
        film(earthDay) = getframe(gcf);
    end
end

%{
    Returns x and y coords for the edge of the orbit
    radius = Radius, obviously
    period = number of days it takes for the planet
%}
function [x, y] = DrawOrbit(radius, period)
    dis = sqrt(radius);
    [x, y] = GetCircle(dis, period, [0, 0]);
    plot(x, y, "--");
end

%{
    radius = Radius, obviously
    x, y = The coordinates of the planet, positioned on their orbit
%}
function DrawBody(radius, x, y)
    radius = sqrt(radius / pi) * 15;
    [px, py] = GetCircle(radius, 100, [x, y]);
    fill(px, py, "r");
end

%{
    Returns x and y coordinate for a planet after days number of earthdays
    days = earthdays since start
    pPeriod = Number of days the planet takes to orbit 360degrees
    ox, oy = The coordinates of the orbits
%}
function [xOff, yOff] = PlanetCoord(days, pPeriod, ox, oy)
    xOff = ox(mod(days, floor(pPeriod))+1);
    yOff = oy(mod(days, floor(pPeriod))+1);
end

%{
    Returns x and y values to for a circle
    radius = Radius, obviously
    points = Number of points on circle. Higher => higher res.
    offset = (x, y) coordinates for offset from origo
%}
function [x, y] = GetCircle(radius, points, offset)
    period = linspace(0, 2*pi, points);
    x = radius * cos(period) + offset(1);
    y = radius * sin(period) + offset(2);
end