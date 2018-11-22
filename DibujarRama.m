%Dibujar árboles
[~, ~, ~, mcrit, ~, PNodes, RS, NP, PCrit, a] = cargar_datos('arbol mas grande menor de 1000.txt', 4);	%Después tocará eliminar
% [~, ~, ~, ~, ~, PNodes, RS] = cargar_datos('mas peque.txt', 0);
a2 = tdfread('arbol mas grande menor de 1000 galaxia.txt',',');


PT = PNodes';       %no queremos sobreescribir %PT=PuntosTest
PNum = NP';
% PNum = log(PNum);
% PNum = PCrit';
% PNum = log10(PNum);
PNum = PNum/max(PNum)*50+1;
PMean = a.m_Mean200;
% MarkerMaxSize = 20; MarkerMinSize = 1;
% PNum = PNum/max(PNum)*(MarkerMaxSize - MarkerMinSize) + MarkerMinSize;

PS = RS';
PTdib = PT';



nodo = 1;
X = zeros(size(PT));
Y = PT;
X(1) = nodo;
Y(1) = PT(1);
saltos = [];
altura = [];
anchura = [];
figure(3)
clf
hold on

% Configurar los colores
jetColorMap = jet(length(PT));
markerColour = zeros(length(PT),3);
markerColour(1,:) = jetColorMap(1,:);

% Calcular
for i = 2: length(PT)
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
        % Dibujar las líneas horizontales
        XR = [X(k),nodo];
        YR = [PT(k),PT(i)];
        plot(XR,YR, '-k')
    end
    markerColour(i,:) = jetColorMap(i,:);
end
xlim([0 nodo+1])


% Poner las figuras de las galaxias coloreadas
size_mult = 20;
for i = 1:length(PT)
    scatter(X(i), Y(i), PNum(i) * size_mult, ...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',markerColour(i,:));
%     drawnow
end
colormap(jetColorMap);
colorbar

% Para dibujarlo sin borde y rápido:
% colormap jet
% scatter(X,Y,PNum*20,Y,'.')
% colorbar




% Dibujar las líneas verticales
sap = 1;
for s = 1:length(saltos)
    sa = saltos(s);
    plot(X(sap:sa-1),Y(sap:sa-1), '-r')
    sap = sa;
end
plot(X(sap:end),Y(sap:end), '-r')