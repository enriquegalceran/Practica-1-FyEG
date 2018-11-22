%Dibujar árboles
[~, ~, ~, ~, ~, PNodes, RS, NP] = cargar_datos('arbol mas grande menor de 1000.txt', 0);	%Después tocará eliminar
% [~, ~, ~, ~, ~, PNodes, RS] = cargar_datos('mas peque.txt', 0);
PT = PNodes';                               %no queremos sobreescribir %PT=PuntosTest
PNum = NP';

MarkerMaxSize = 20; MarkerMinSize = 5;
PNum = PNum/max(PNum)*(MarkerMaxSize - MarkerMinSize) + MarkerMinSize;

PS = RS';
PTdib = PT';



nodo = 1;
X = zeros(size(PT));
Y = X;
X(1) = nodo;
Y(1) = PT(1);
saltos = [];
altura = [];
anchura = [];
figure(3)
clf
hold on
for i = 2: length(PT)
    Y(i) = PT(i);
    if PT(i)<PT(i-1)
        X(i) = nodo;
    else
        k = i-1;
        while PT(k) ~= PT(i) +1
            k = k - 1;
        end
        anchura = [anchura, X(k)];
        altura = [altura, PT(k)];
        saltos = [saltos, i];
        nodo = nodo + 1;
        X(i) = nodo;
        
        XR = [X(k),nodo];
        YR = [PT(k),PT(i)];
        plot(XR,YR, '-k')
    end
    plot(X(i),Y(i), 'o-b', 'MarkerSize',PNum(i))
%     drawnow
    
end
xlim([0 nodo+1])

sap = 1;
for s = 1:length(saltos)
    sa = saltos(s);
    plot(X(sap:sa-1),Y(sap:sa-1), '-r')
    sap = sa;
end
plot(X(sap:end),Y(sap:end), '-r')