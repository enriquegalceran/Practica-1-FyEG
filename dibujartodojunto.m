% Dibujar todos los plots juntos
% DM sin barras de error
figure(99)
clf
hold on
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 8-10.mat')
plot(X1,Y1)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 10-11.5.mat')
plot(X1,Y1)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 11.5-12.5.mat')
plot(X1,Y1)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 12.5.mat')
plot(X1,Y1)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'MCrit200'

% bariones sin barras de error
figure(98)
clf
hold on
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 8-10.mat')
plot(X2,Y2)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 10-11.5.mat')
plot(X2,Y2)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 11.5-12.5.mat')
plot(X2,Y2)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 12.5.mat')
plot(X2,Y2)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'Bariones'

% DM con barras de error
figure(97)
clf
hold on
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 8-10.mat')
errorbar(X1,Y1,Z1)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 10-11.5.mat')
errorbar(X1,Y1,Z1)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 11.5-12.5.mat')
errorbar(X1,Y1,Z1)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 12.5.mat')
errorbar(X1,Y1,Z1)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'MCrit200'

% Bariones con barras de error
figure(98)
clf
hold on
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 8-10.mat')
errorbar(X2,Y2,Z2)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 10-11.5.mat')
errorbar(X2,Y2,Z2)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 11.5-12.5.mat')
errorbar(X2,Y2,Z2)
load('I:\Archivos Usuario\Documentos\GitHub\Practica-1-FyEG\Variables\Datos 12.5.mat')
errorbar(X2,Y2,Z2)
legend('8-10', '10-11.5', '11.5-12.5', '12.5')
title 'Bariones'