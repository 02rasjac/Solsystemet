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
    hold on
    for planet = p
        pName = planet{1};
        dis = sqrt(r(pName));
        [x, y] = GetCircle(dis, t(pName), [0, 0]);
        plot(x, y);

        pRadius = sqrt(pr(pName) / pi) * 15;
        [px, py] = GetCircle(pRadius, 100, [x(1), y(1)]);
        fill(px, py, "r");
    end
    hold off
    axis equal
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