function [np, snapNum, redshift, m_Crit200, max_length, PNodes, RS, PNP, PCrit, a] = cargar_datos(nombre_archivo, Ajustar_monotona_decreciente)
% Carga los datos y limpia un poco

a = tdfread(nombre_archivo,',');


%Corte 
snapNum = a.snapNum;
PNodes = snapNum;
RS = a.redshift;
PNP = a.np;
PCrit = a.m_Crit200;
max_length = length(snapNum);

for i = 2:max_length
    if snapNum(i) >= snapNum(i-1)
        max_length = i-1;
        break
    end
end

snapNum = snapNum(1:max_length);
np = a.np(1:max_length);
redshift = a.redshift(1:max_length,:);
m_Crit200 = a.m_Crit200(1:max_length,:);

% Cambia el vector de caracteres a doble precisión de ser un caracter
% Hay que activar estas líneas si se importa antes por Excel Europeo donde
% la coma y el punto está al revés
% redshift = limpiar_str(redshift);
% m_Crit200 = limpiar_str(a.m_Crit200(1:max_length,:));


%corregir np para posibles pequeños valores donde partículas se hayan
%salido momentáneamente del R_200

if Ajustar_monotona_decreciente == 1
    % Solamente se reduce en el caso de que sean mayor de lo que que
    % debería ser
    for i = 1: max_length-1
        if np(i)<np(i+1)
            np(i+1)=np(i);
        end
    end
    
elseif Ajustar_monotona_decreciente == 2 
    % Saca la media de los dos de alrededor
    control = 1;
    while control == 1
        control = 0;
        for i = 2: max_length-1
            if np(i-1)>np(i) && np(i)<np(i+1) && np(i-1)>np(i+1)
                control = 1;
                np(i)=(np(i-1)+np(i+1))/2;
            end
        end
    end
    
elseif Ajustar_monotona_decreciente == 3
        for i = 1: max_length-1
            if np(i)<np(i+1)
                np(i+1)=np(i);
            end
        end
elseif Ajustar_monotona_decreciente == 4
    for i = max_length-1:-1: 1
        if m_Crit200(i)<m_Crit200(i+1)
            m_Crit200(i)=m_Crit200(i+1);
        end
    end
    
end

end