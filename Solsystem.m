%{
    p  = Cell of planets names
    r  = The planets orbital radius
    t  = The planets orbital timeperiod
    pm = Mass of the planets
    mp = Månarnas planet de rör sig runt
    mr = Månbanornas radie runt planeten
    mt = Månarnas omloppstid
%}
function film = Solsystem(p, r, t, pr)
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
            dis = sqrt(r(pName));
            [x, y] = GetCircle(dis, t(pName), [0, 0]);
            plot(x, y, "--");

            xOff = x(mod(earthDay, floor(t(pName)))+1);
            yOff = y(mod(earthDay, floor(t(pName)))+1);
            pRadius = sqrt(pr(pName) / pi) * 15;
            [px, py] = GetCircle(pRadius, 100, [xOff, yOff]);
            fill(px, py, "r");
        end
        hold off
        axis equal
        earthDay = earthDay + 1;
        film(earthDay) = getframe(gcf);
    end
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