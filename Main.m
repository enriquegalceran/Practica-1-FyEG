masa_np = 8.6e8; %M_sun/h

% a=tdfread('5000058000000.txt','\t');

% Orden de las cosas:
% -Primero carga todas las variables en una función.
% -Después genera las variables redshift y número de partículas
% -Voy a usar las partículas en vez de la masa como indicador porque es más
%   fiable a la larga.
% -mira por el snapshot hasta encontrar alguno que se repita
% -Tengo que crear una carpeta con todos los datos en CVS para importarlos.
% -genera diferentes variables para separar por categoría

[np, snapNum, redshift, m_Crit200, max_length] = cargar_datos('5000058000000.txt');

% Esto es para dibujar una primera aproximación con los datos sólo pasados
% por cargar_datos
%
% figure(1)
% clf
% hold on
% plot(log10(1+redshift),log10(m_Crit200/max(m_Crit200)));
% plot(log10(1+redshift), log10(np/max(np)));
% legend('mCrit200', 'np')



% Comprobamos a ver que tal se compara una masa con la otra
% figure(2)
masa_nueva = np*masa_np;
m_Crit = m_Crit200*1e10;
% relacion_masas = masa_nueva;
% for i = 1:max_length
%     relacion_masas(i) = m_Crit(i)/masa_nueva(i);
% end
% plot(redshift,relacion_masas);



%% 





