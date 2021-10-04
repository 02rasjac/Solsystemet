%{
    r = Planetbanornas radie
    t = Planeternas omloppstid
    mp = Månarnas planet de rör sig runt
    mr = Månbanornas radie runt planeten
    mt = Månarnas omloppstid
%}
function film = Solsystem(p, r, t)
    a = 0:0.1:2*pi;
    hold on
    for planet = p
        pName = planet{1};
        dis = sqrt(r(pName));
        time = linspace(0, 2*pi, t(pName));
        x = dis * cos(time);
        y = dis * sin(time);
        plot(x, y);
    end
    hold off
    axis equal
end