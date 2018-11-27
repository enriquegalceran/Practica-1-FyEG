% Dibujar todos los plots juntos
% DM sin barras de error
figure(99)
clf
hold on
load('Variables/Datos 8-10.mat')
plot(X1,Y1)
load('Variables/Datos 10-11.5.mat')
plot(X1,Y1)
load('Variables/Datos 11.5-12.5.mat')
plot(X1,Y1)
load('Variables/Datos 12.5.mat')
plot(X1,Y1)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'MCrit200'
saveas(gcf,'DibAuto/DM sin barras.png')

% bariones sin barras de error
figure(98)
clf
hold on
load('Variables/Datos 8-10.mat')
plot(X2,Y2)
load('Variables/Datos 10-11.5.mat')
plot(X2,Y2)
load('Variables/Datos 11.5-12.5.mat')
plot(X2,Y2)
load('Variables/Datos 12.5.mat')
plot(X2,Y2)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'Bariones'
saveas(gcf,'DibAuto/Bariones sin barras.png')

% DM con barras de error
figure(97)
clf
hold on
load('Variables/Datos 8-10.mat')
errorbar(X1,Y1,Z1)
load('Variables/Datos 10-11.5.mat')
errorbar(X1,Y1,Z1)
load('Variables/Datos 11.5-12.5.mat')
errorbar(X1,Y1,Z1)
load('Variables/Datos 12.5.mat')
errorbar(X1,Y1,Z1)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'MCrit200'
saveas(gcf,'DibAuto/DM con barras.png')

% Bariones con barras de error
figure(96)
clf
hold on
load('Variables/Datos 8-10.mat')
errorbar(X2,Y2,Z2)
load('Variables/Datos 10-11.5.mat')
errorbar(X2,Y2,Z2)
load('Variables/Datos 11.5-12.5.mat')
errorbar(X2,Y2,Z2)
load('Variables/Datos 12.5.mat')
errorbar(X2,Y2,Z2)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'Bariones'
saveas(gcf,'DibAuto/Bariones con barras.png')
