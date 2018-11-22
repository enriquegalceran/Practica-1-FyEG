%Analisis

masa_np = 8.6e8; %M_sun/h
masa_Crit200 = 1e10; %M_sun/h
path_Data = 'Todo\Completo\';
normalizado = 1e10; %M_sun/h es para normalizarlo

% Ajustar_monotona_decreciente nos indica el modo en el cual se encuentra a
% la hora de limpiar y corregir los datos para posibles subidas:
%       1.- Si np(i+1)=np(i) si np(i+1)>np(i)
%       2.- Si hay una caida drástica en un punto, se saca la media hasta
%       que todo esté limpio. %Tiene Bugs...
%       3.- Ademas de 2, después pasa el modo 1 por encima.
Ajustar_monotona_decreciente = 4;


dinfo = dir([path_Data, '*.txt']);
n_data = length(dinfo);
all_snapNum = zeros(200,n_data);
all_redshift = zeros(200,n_data);
all_np = zeros(200,n_data);
all_m_Crit200 = zeros(200,n_data);
all_max_len = zeros(1,n_data);


%para mostrar sólamente unos específicos
% DataSetTest = [24, 29, 30, 31, 36];
% for testJ = 1: length(DataSetTest)
%     K = DataSetTest(testJ);
    
for K = 1 : length(dinfo)

    thisfilename = dinfo(K).name;  %just the name
    % Cargamos Datos
    [np, snapNum, redshift, m_Crit200, max_length] = cargar_datos(sprintf('%s%s',path_Data,thisfilename), Ajustar_monotona_decreciente);
    for j = 1:max_length
        all_snapNum(j,K) = snapNum(j);
        all_redshift(j,K) = redshift(j);
        all_np(j,K) = np(j);
        all_m_Crit200(j,K) = m_Crit200(j);
    end
    all_max_len(K) = max_length;
end
all_np = all_np * masa_np;
all_m_Crit200 = all_m_Crit200 * masa_Crit200;

% Creamos la gráfica
figure(1)
clf
hold on
for j = 1:n_data
    plot(log10(1+all_redshift(1:all_max_len(j),j)),log10(all_m_Crit200(1:all_max_len(j),j)/normalizado))
end
title 'mCrit200'


figure(2)
clf
hold on
for j = 1:n_data
    plot(log10(1+all_redshift(1:all_max_len(j),j)),log10(all_np(1:all_max_len(j),j)/normalizado))
end
title 'np'
% legend('24', '29', '30', '31', '36') %está aquí de la prueba para ver que
% modo utilizo