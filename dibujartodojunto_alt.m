% Dibujar todos los plots juntos


% DM con barras de error
figure(95)
clf
hold on
load('Variables/Datos 8-10.mat')
h1 = plot(X1,Y1, '-b');
plot(X1,Y1+Z1, ':b')
plot(X1,Y1-Z1, ':b')
load('Variables/Datos 10-11.5.mat')
h2 = plot(X1,Y1, '-r');
plot(X1,Y1+Z1, ':r')
plot(X1,Y1-Z1, ':r')
load('Variables/Datos 11.5-12.5.mat')
h3 = plot(X1,Y1, '-g');
plot(X1,Y1+Z1, ':g')
plot(X1,Y1-Z1, ':g')
load('Variables/Datos 12.5.mat')
h4 = plot(X1,Y1, '-k');
plot(X1,Y1+Z1, ':k')
plot(X1,Y1-Z1, ':k')
legend([h1 h2 h3 h4], '8-10', '10-11.5', '11.5-12.5', '12.5')
title 'MCrit200'
saveas(gcf,'DibAuto/DM con barras alt.png')

% Bariones con barras de error
figure(94)
clf
hold on
load('Variables/Datos 8-10.mat')
h1 = plot(X2,Y2, '-b');
plot(X2,Y2+Z2, ':b')
plot(X2,Y2-Z2, ':b')
load('Variables/Datos 10-11.5.mat')
h2 = plot(X2,Y2, '-r');
plot(X2,Y2+Z2, ':r')
plot(X2,Y2-Z2, ':r')
load('Variables/Datos 11.5-12.5.mat')
h3 = plot(X2,Y2, '-g');
plot(X2,Y2+Z2, ':g')
plot(X2,Y2-Z2, ':g')
load('Variables/Datos 12.5.mat')
h4 = plot(X2,Y2, '-k');
plot(X2,Y2+Z2, ':k')
plot(X2,Y2-Z2, ':k')
legend([h1 h2 h3 h4], '8-10', '10-11.5', '11.5-12.5', '12.5')
title 'Bariones'
saveas(gcf,'DibAuto/Bariones con barras alt.png')
