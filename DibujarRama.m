%Dibujar árboles
% [~, ~, ~, mcrit, ~, PNodes, RS, NP, PCrit, a1] = cargar_datos('arbol mas grande menor de 1000.txt', 4);	%Después tocará eliminar
% a2 = tdfread('arbol mas grande menor de 1000G.txt',',');
% [~, ~, ~, mcrit, ~, PNodes, RS, NP, PCrit, a1] = cargar_datos('mas peque.txt', 0);
% a2 = tdfread('mas pequeG.txt',',');
[~, ~, ~, mcrit, ~, PNodes, RS, NP, PCrit, a1] = cargar_datos('3000060000000.txt', 4);	%Después tocará eliminar
a2 = tdfread('3000060000000g.txt',',');


magB = zeros(1,length(a1.snapNum));
magV = magB;

for i = 1:length(a1.snapNum)
    for j = 1:length(a2.snapnum)
        if a1.haloID(i) == a2.haloID(j)
            magB(i) = a2.mag_b(j);
            magV(i) = a2.mag_v(j);
            break
        end
    end
end

EC = magB - magV;
EC = EC';

PT = PNodes';       %no queremos sobreescribir %PT=PuntosTest
PNum = NP';

nodo = 1;
X = zeros(size(PT));
% Y = PT;
Y = -log10(1 + RS');
X(1) = nodo;
saltos = [];
altura = [];
anchura = [];
figure(3)
clf
hold on

% Configurar los colores
resolucion_colores = 200;
jetColorMap = jet(resolucion_colores);
markerColour = zeros(length(EC),3);
markerindex2 = zeros(1,length(EC));
min_color = min(EC);
max_color = max(EC);
markerindex = linspace(min_color,max_color,resolucion_colores);

for p = 1:length(EC)
    t = 1;
    while markerindex(t) < EC(p)
        t = t + 1;
    end
    markerindex2(p) = t;
    markerColour(p,:) = jetColorMap(t,:);
end

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
        YR = [Y(k),Y(i)];
        plot(XR,YR, '-k')
    end
end
xlim([0 nodo+1])

% Hace Monótona decreciente también las ramas
k = length(PT) - 1;
for i = nodo:-1:1
    while X(k) == i
        if PNum(k)< PNum(k+1)
            PNum(k) = PNum(k+1);
        end
        k = k - 1;
        if k == 0
            break
        end
    end
    k = k - 1;
end

% Cambiar para poder dibujarlas. Tiene que hacerse esto después de cambiar
% el tamaño de las ramas o si no no serán los datos correctos.
PNum = PNum/max(PNum)*35+1;

% Dibujar las líneas verticales
sap = 1;
for s = 1:length(saltos)
    sa = saltos(s);
    plot(X(sap:sa-1),Y(sap:sa-1), '-k')
    sap = sa;
end
plot(X(sap:end),Y(sap:end), '-k')

[~, pos_max] = max(PNum);
[~, pos_min] = min(PNum);
% Poner las figuras de las galaxias coloreadas
size_mult = 20;
for i = 1:length(PT)
    if i == pos_max
        h1 = plot(X(i),Y(i),'o','MarkerFaceColor', 'k', 'MarkerEdgeColor','black','MarkerSize', 25.2);
    elseif i == 27
        h2 = plot(X(i),Y(i),'o','MarkerFaceColor', 'k', 'MarkerEdgeColor','black','MarkerSize', 18);
    elseif i == 512
        h3 = plot(X(i),Y(i),'o','MarkerFaceColor', 'k', 'MarkerEdgeColor','black','MarkerSize', 8);
    elseif i == pos_min
        h4 = plot(X(i),Y(i),'o','MarkerFaceColor', 'k', 'MarkerEdgeColor','black','MarkerSize', 4);
    end
    scatter(X(i), Y(i), PNum(i) * size_mult, ...
            'MarkerEdgeColor','black',...
            'MarkerFaceColor',markerColour(i,:));
%     drawnow %descomentar para tener la animación
end


colormap(jetColorMap);
cbv=colorbar('v'); %cambiar v(ertical) h(orizontal)
set(cbv,'YTick',0:1/15:1) %cambiar la cantidad de ticks
% se puede cambiar las cifras significativas
cbv.TickLabels = arrayfun( @num2str,...
                          round(cbv.Ticks * (max_color-min_color) + min_color,3),...
                          'UniformOutput', false );
                      
% etiquetas ejes Y y quitamos X
ylabel(cbv, 'B-V')
ylabel '-log_1_0(1+z)'
set(gca, 'XTick', [])


% Leyenda tamaños
legend([h1 h2 h3 h4],'1478.95· 10^1^0 Msun/h','975.29· 10^1^0 Msun/h',...
    '142.18· 10^1^0 Msun/h', '1.29· 10^1^0 Msun/h',...
    'Orientation', 'horizontal',...
    'Location', 'south')

legend boxoff

