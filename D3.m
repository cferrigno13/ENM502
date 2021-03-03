%% Problem 3
%% 1D Solutions

OD10 = figure(1);
h = 1/10;
al = 2;
T = onedee(h,al);
plot(T)
title('1D 11 nodes')
saveas(OD10,'1D11nodes.png')

OD20 = figure(2);
h = 1/20;
al = 2;
T = onedee(h,al);
plot(T)
title('1D 21 nodes')
saveas(OD20,'1D21nodes.png')

OD50 = figure(3);
h = 1/50;
al = 2;
T = onedee(h,al);
plot(T)
title('1D 51 nodes')
saveas(OD50,'1D51nodes.png')

OD70 = figure(4);
h = 1/70;
al = 2;
T = onedee(h,al);
plot(T)
title('1D 71 nodes')
saveas(OD70,'1D71nodes.png')

OD100 = figure(5);
h = 1/100;
al = 2;
T = onedee(h,al);
plot(T)
title('1D 101 nodes')
saveas(OD100,'1D101nodes.png')

%% 2D Solutions


TD10 = figure(6);
h = 1/10;
al = 2;
T = twodee(h,al);
r = length(T)^(1/2);
Tr = reshape(T,r,r);
X = 1:(1/h)+1;
Y = 1:(1/h)+1;
contourf(X,Y,Tr)
title('2D N=10')
saveas(TD10,'2D11nodes.png')

TD20 = figure(7);
h = 1/20;
al = 2;
T = twodee(h,al);
r = length(T)^(1/2);
Tr = reshape(T,r,r);
X = 1:(1/h)+1;
Y = 1:(1/h)+1;
contourf(X,Y,Tr)
title('2D N=20')
saveas(TD20,'2D21nodes.png')

TD50 = figure(8);
h = 1/50;
al = 2;
T = twodee(h,al);
r = length(T)^(1/2);
Tr = reshape(T,r,r);
X = 1:(1/h)+1;
Y = 1:(1/h)+1;
contourf(X,Y,Tr)
title('2D N=50')
saveas(TD50,'2D51nodes.png')

TD70 = figure(9);
h = 1/70;
al = 2;
T = twodee(h,al);
r = length(T)^(1/2);
Tr = reshape(T,r,r);
X = 1:(1/h)+1;
Y = 1:(1/h)+1;
contourf(X,Y,Tr)
title('2D N=70')
saveas(TD70,'2D71nodes.png')

TD100 = figure(10);
h = 1/100;
al = 2;
T = twodee(h,al);
r = length(T)^(1/2);
Tr = reshape(T,r,r);
X = 1:(1/h)+1;
Y = 1:(1/h)+1;
contourf(X,Y,Tr)
title('2D N=100')
saveas(TD100,'2D101nodes.png')