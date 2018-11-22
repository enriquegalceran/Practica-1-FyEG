%Dibujar árboles
[~, ~, ~, ~, ~, PNodes, RS] = cargar_datos('arbol mas grande menor de 1000.txt', 0);	%Después tocará eliminar
% [~, ~, ~, ~, ~, PNodes, RS] = cargar_datos('mas peque.txt', 0);
PT = PNodes';                               %no queremos sobreescribir %PT=PuntosTest
PN = zeros(size(PT));
PTdib = PT';
nodo = 0;
nodo_guardado = 0;
tipo_nodo = 0;
PN(1) = 0;
for i = 2: length(PT)
    if PT(i)<PT(i-1)
        tipo_nodo = 0;
    else
        tipo_nodo = 1;
    end
    
    if tipo_nodo == 0
        nodo = nodo + 1;
        PN(i) = nodo;
    else
        k = i-1;
        while PT(k) ~= PT(i)
            k = k - 1;
        end
        PN(i) = PN(k + 1) + 1;
        nodo = nodo + 1;
    end
    
    
end



[x,y] = treelayout(PN);
y = log10(1 + PT);
figure(1)
treeplot(PN);

