function limpio = limpiar_str(sucio)
%Limpia una martriz caracteres con separador decimal ',' a doble precisión.

aux1 = sucio;
aux2 = zeros(length(sucio),1);
for i = 1:length(sucio)
    aux1(i,:) = strrep(sucio(i,:),',','.');
    aux2(i) = str2double(aux1(i,:));
end
limpio = aux2;
end