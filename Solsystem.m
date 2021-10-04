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
    a = 0:0.1:2*pi;
    hold on
    for planet = p
        pName = planet{1};
        dis = sqrt(r(pName));
        time = linspace(0, 2*pi, t(pName));
        x = dis * cos(time);
        y = dis * sin(time);
        plot(x, y);

        pRadius = sqrt(pr(pName) / pi) * 15;
        px = pRadius * cos(a) + x(1);
        py = pRadius * sin(a) + y(1);
        fill(px, py, "r");
    end
    hold off
    axis equal
end