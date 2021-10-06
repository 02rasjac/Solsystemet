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
    lims = [-max(r)-mr(end), max(r)+mr(end)];

    fig = figure(1);
    fig.Position(1:2) = [0, 0];
    fig.Position(3:4) = [1280, 1024];
    I = imread("background.jpg");
    while earthDay <= nDays
        clf;
        xlim(lims);
        ylim(lims);
        image(xlim, -ylim, I);
        hold on
        for idx = 1:length(r)
            % Planets orbit
            [x, y] = DrawOrbit(r(idx), t(idx), [0, 0]);

            % Planet itself
            [px, py] = PlanetCoord(earthDay, t(idx), x, y);
            DrawBody(2.5, px, py, "r");

            % Moon
            for moonIdx = find(m == idx)
                [x, y] = DrawOrbit(mr(moonIdx), mt(moonIdx), [px, py]);
                [mx, my] = PlanetCoord(earthDay, mt(moonIdx), x, y);
                DrawBody(1.5, mx, my, "c");
            end
        end
        hold off
        axis square
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
    plot(x, y, "k-", "LineWidth", 1);
end

%{
    radius = Radius, obviously
    x, y = The coordinates of the planet, positioned on their orbit
%}
function DrawBody(radius, x, y, color)
    [px, py] = GetCircle(radius, 100, [x, y]);
    fill(px, py, color);
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