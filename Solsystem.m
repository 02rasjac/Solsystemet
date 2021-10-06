% TODO: Only use 5 planets, the scale gets reallly hard to understand otherwise

%{
    r  = The planets orbital radius
    t  = The planets orbital timeperiod
    m  = The names of the planets moons
    mr = The moons orbital radius
    mt = The moons orbital timeperiod
%}
function film = Solsystem(r, t, m, mr, mt)
    earthDay = 0;
    nDays = 60;

    fig = figure(1);
    fig.Position(1:2) = [100, 100];
    fig.Position(3:4) = [560*2, 420*2];
    while earthDay <= nDays
        clf;
        hold on
        for idx = 1:length(r)
            % Planets orbit
            [x, y] = DrawOrbit(r(idx), t(idx), [0, 0]);

            % Planet itself
            [px, py] = PlanetCoord(earthDay, t(idx), x, y);
            DrawBody(2, px, py);

            % Moon
            for moonIdx = find(m == idx)
                [x, y] = DrawOrbit(mr(moonIdx), mt(moonIdx), [px, py]);
                [mx, my] = PlanetCoord(earthDay, mt(moonIdx), x, y);
                DrawBody(1, mx, my);
            end
        end
        hold off
        axis equal
        xlim([-max(r)-mr(end), max(r)+mr(end)]);
        ylim([-max(r)-mr(end), max(r)+mr(end)]);
        earthDay = earthDay + 1;
        film(earthDay) = getframe(gcf);
    end
end

%{
    Returns x and y coords for the edge of the orbit
    radius = Radius, obviously
    period = number of days it takes for the planet
%}
function [x, y] = DrawOrbit(radius, period, offset)
    [x, y] = GetCircle(radius, period, offset);
    plot(x, y, "--", "LineWidth", 1);
end

%{
    radius = Radius, obviously
    x, y = The coordinates of the planet, positioned on their orbit
%}
function DrawBody(radius, x, y)
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