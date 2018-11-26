%Analisis
clear

masa_Crit200 = 1e10; %M_sun/h

path_Data = 'Data\8-10\';
path_DataG = 'Data\8-10G\';
% path_Data = 'Data\10-11.5\';
% path_DataG = 'Data\10-11.5G\';
% path_Data = 'Data\11.5-12.5\';
% path_DataG = 'Data\11.5-12.5G\';
% path_Data = 'Data\12.5\';
% path_DataG = 'Data\12.5G\';


Ajustar_monotona_decreciente = 4;


dinfo = dir([path_Data, '*.txt']);
n_data = length(dinfo); %cantidad de puntos que hay

%%
tomar_datos = 1;
if tomar_datos == 1
    all_snapNum = zeros(100,n_data);
    all_redshift = zeros(100,n_data);
    all_np = zeros(100,n_data);
    all_m_Crit200 = zeros(100,n_data);
    all_max_len = zeros(1,n_data);
    all_snapNumG = all_snapNum;
    all_redshiftG = all_redshift;
    all_npG = all_np;
    all_stellarG = all_m_Crit200;
    all_max_lenG = all_max_len;
    
    %para mostrar sólamente unos específicos
    % DataSetTest = [24, 29, 30, 31, 36];
    % for testJ = 1: length(DataSetTest)
    %     K = DataSetTest(testJ);

    for K = 1 : n_data
        
        thisfilename = dinfo(K).name;  %just the name
        % Cargamos Datos
        [np, snapNum, redshift, m_Crit200, max_length, ~, ~, ~, ~, a1] = cargar_datos(sprintf('%s%s',path_Data,thisfilename), Ajustar_monotona_decreciente);
        all_snapNum(1:max_length,K) = snapNum;
        all_redshift(1:max_length,K) = redshift;
        all_np(1:max_length, K) = np;
        all_m_Crit200(1:max_length,K) = m_Crit200;
        all_max_len(K) = max_length;

        [a2,stellarMass, max_lengthg, snapNumG] = cargar_galaxias(sprintf('%s%s',path_DataG,thisfilename), a1);
        all_stellarG(1:max_lengthg,K) = stellarMass;
        all_max_lenG(K) = max_lengthg;
        all_snapNumG(1:max_lengthg,K) = snapNumG;
        
    end
end

redshift_dibujar_ind = 0;
for i = 1:n_data
    for j = 1:63
        if all_redshift(j,i) ~= 0
            if j>redshift_dibujar_ind
                redshift_dibujar_ind = j;
                redshift_dibujar_ext = i;
            end
        end
    end
end
redshift_dibujar = all_redshift(1:redshift_dibujar_ind,redshift_dibujar_ext);
%% 
% Creamos la gráfica
dall_m_Crit200 = all_m_Crit200 * masa_Crit200;
figure(1)
clf
hold on
for j = 1:n_data
    plot(log10(1+all_redshift(1:all_max_len(j),j)),log10(dall_m_Crit200(1:all_max_len(j),j)/dall_m_Crit200(1,j)))
end
title 'mCrit200'
saveas(gcf, sprintf('DibAuto/MCrit200 %s.png',path_Data(6:end-1))) 

dall_stellar = all_stellarG * masa_Crit200;
figure(2)
clf
hold on
for j = 1:n_data
    plot(log10(1+all_redshift(1:all_max_len(j),j)),log10(dall_stellar(1:all_max_len(j),j)/dall_stellar(1,j)))
end
title 'Bariones'
saveas(gcf, sprintf('DibAuto/Bariones %s.png',path_Data(6:end-1))) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ahora calculamos la media DM
% max_SN = max(all_snapNum(:));
% min_SN = min(nonzeros(all_snapNum));
valores_medios = zeros(1,63);
numero_medios = valores_medios;
tabla_completa = zeros(63,n_data);

for i = 1:n_data
    for j = 1:all_max_len(i)
        if all_m_Crit200(j,i) ~= 0
            valores_medios(64-all_snapNum(j,i)) = valores_medios(64-all_snapNum(j,i)) + all_m_Crit200(j,i);
            numero_medios(64-all_snapNum(j,i)) = numero_medios(64-all_snapNum(j,i)) + 1;
            tabla_completa(64-all_snapNum(j,i),i) = tabla_completa(64-all_snapNum(j,i),i) + all_m_Crit200(j,i);
        else
            break
        end
    end
end
desviacion_std = zeros(1,63);
% Desviación
for i = 1:63
    desviacion_std(i) = std(nonzeros(tabla_completa(i,:)));
end
desviacion_std(isnan(desviacion_std)) = [];

[~, indx] = max(all_max_len);
figure(3)
errorbar(log10(1+all_redshift(1:all_max_len(indx),indx)),log10(valores_medios(1:all_max_len(indx))/valores_medios(1)), log10(desviacion_std));
title 'media MCrit'
saveas(gcf, sprintf('DibAuto/Media MCrit200 %s.png',path_Data(6:end-1))) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
valores_mediosG = zeros(1,63);
numero_mediosG = valores_mediosG;
tabla_completaG = zeros(63,n_data);

for i = 1:n_data
    for j = 1:all_max_lenG(i)
        if all_m_Crit200(j,i) ~= 0
            valores_mediosG(64-all_snapNum(j,i)) = valores_mediosG(64-all_snapNumG(j,i)) + all_stellarG(j,i);
            numero_mediosG(64-all_snapNum(j,i)) = numero_mediosG(64-all_snapNumG(j,i)) + 1;
            tabla_completaG(64-all_snapNum(j,i),i) = tabla_completaG(64-all_snapNumG(j,i),i) + all_stellarG(j,i);
        else
            break
        end
    end
end
desviacion_stdG = zeros(1,63);
% Desviación
for i = 1:63
    desviacion_stdG(i) = std(nonzeros(tabla_completaG(i,:)));
end
desviacion_stdG(isnan(desviacion_stdG)) = 0;
[~, indxG] = max(all_max_lenG);
for i = 1: 63
    if valores_mediosG(i) == 0
        indxG2 = i-1;
        break
    end
end
figure(4)
errorbar(log10(1+redshift_dibujar(1:indxG2)),log10(valores_mediosG(1:indxG2)/valores_mediosG(1))', log10(desviacion_stdG(1:indxG2)));
title 'media bariones'
saveas(gcf, sprintf('DibAuto/Media Bariones %s.png',path_Data(6:end-1))) 

figure(5)
clf
hold on
errorbar(log10(1+all_redshift(1:all_max_len(indx),indx)),log10(valores_medios(1:all_max_len(indx))/valores_medios(1)), log10(desviacion_std))
errorbar(log10(1+redshift_dibujar(1:indxG2)),log10(valores_mediosG(1:indxG2)/valores_mediosG(1))', log10(desviacion_stdG(1:indxG2)));
title(path_Data(6:end-1))
legend('DM', 'Bariones')
saveas(gcf, sprintf('DibAuto/Media Ambos %s.png',path_Data(6:end-1)))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Guardar todo
X1 = log10(1+all_redshift(1:all_max_len(indx),indx));
Y1 = log10(valores_medios(1:all_max_len(indx))/valores_medios(1));
Z1 = log10(desviacion_std);
X2 = log10(1+redshift_dibujar(1:indxG2));
Y2 = log10(valores_mediosG(1:indxG2)/valores_mediosG(1))';
Z2 = log10(desviacion_stdG(1:indxG2));

save(sprintf('Variables/Datos %s.mat',path_Data(6:end-1)),'X1', 'Y1', 'Z1', 'X2', 'Y2', 'Z2')