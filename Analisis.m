%Analisis

masa_np = 8.6e8; %M_sun/h
masa_Crit200 = 1e10; %M_sun/h
path_Data = 'Todo\';

% Ajustar_monotona_decreciente nos indica el modo en el cual se encuentra a
% la hora de limpiar y corregir los datos para posibles subidas:
%       1.- Si np(i+1)=np(i) si np(i+1)>np(i)
%       2.- Si hay una caida drástica en un punto, se saca la media hasta
%       que todo esté limpio. %Tiene Bugs...
%       3.- Ademas de 2, después pasa el modo 1 por encima.
%       4.- la versión correcta. f(i)<f(i+1) -> f(i) = f(i+1) [empezando
%       por el final.
Ajustar_monotona_decreciente = 4;


dinfo = dir([path_Data, '*.txt']);
n_data = length(dinfo); %cantidad de puntos que hay



if exist('all_snapNum','var') == 0
    all_snapNum = zeros(100,n_data);
    all_redshift = zeros(100,n_data);
    all_np = zeros(100,n_data);
    all_m_Crit200 = zeros(100,n_data);
    all_max_len = zeros(1,n_data);
    
    %para mostrar sólamente unos específicos
    % DataSetTest = [24, 29, 30, 31, 36];
    % for testJ = 1: length(DataSetTest)
    %     K = DataSetTest(testJ);

    for K = 1 : n_data

        thisfilename = dinfo(K).name;  %just the name
        % Cargamos Datos
        [np, snapNum, redshift, m_Crit200, max_length] = cargar_datos(sprintf('%s%s',path_Data,thisfilename), Ajustar_monotona_decreciente);
        all_snapNum(1:max_length,K) = snapNum;
        all_redshift(1:max_length,K) = redshift;
        all_np(1:max_length,K) = np;
        all_m_Crit200(1:max_length,K) = m_Crit200;
        all_max_len(K) = max_length;
    end
end

mat = all_m_Crit200;
[~,idx] = sort(mat(1,:)); % sort just the first row
sortedmat = mat(:,idx);   % sort the whole matrix using the sort indices
sortedmat2 = sortedmat; %Copia que se borrará después. es por si acaso
sortedlen = all_max_len(idx);
K_G = [0.01, 1, 32, 316, +inf];
% K_G = [32, 316, +inf];
kg = 1;
%1
indx1 = find(sortedmat(1,:)<K_G(1));
grupo1 = sortedmat(:,indx1);
if isempty(indx1), indx1 = 0; end
sortedmat = sortedmat(indx1(end) + 1 : end, :);
%2
indx2 = find(sortedmat(1,:)<K_G(2));
grupo2 = sortedmat(:,indx2);
if isempty(indx2), indx2 = 0; end
sortedmat = sortedmat(indx2(end) + 1 : end, :);
%3
indx3 = find(sortedmat(1,:)<K_G(3));
grupo3 = sortedmat(:,indx3);
if isempty(indx3), indx3 = 0; end
sortedmat = sortedmat(indx3(end) + 1 : end, :);
%4
indx4 = find(sortedmat(1,:)<K_G(4));
grupo4 = sortedmat(:,indx4);
if isempty(indx4), indx4 = 0; end
sortedmat = sortedmat(indx4(end) + 1 : end, :);
%5
grupo5 = sortedmat;


% Creamos la gráfica

dall_m_Crit200 = all_m_Crit200 * masa_Crit200;
figure(1)
clf
hold on
for j = 1:n_data
    plot(log10(1+all_redshift(1:all_max_len(j),j)),log10(dall_m_Crit200(1:all_max_len(j),j)/dall_m_Crit200(1,j)))
end
title 'mCrit200'


% figure(2)
% clf
% hold on
% all_np = all_np * masa_np;
% for j = 1:n_data
%     plot(log10(1+all_redshift(1:all_max_len(j),j)),log10(all_np(1:all_max_len(j),j)/all_np(1,j)))
% end
% title 'np'
% legend('24', '29', '30', '31', '36') %está aquí de la prueba para ver que
% modo utilizo