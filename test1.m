% test galaxias

% a1 = tdfread('mas peque.txt',',');
% a2 = tdfread('mas pequeG.txt',',');
% 
% incidencias = zeros(128,1);
% for i = 1:128
%     for j = 1:167
%         if a1.haloID(i) == a2.haloID(j)
%             incidencias(i) = incidencias(i) + 1;
%         end
%     end
% end


hold on
for i = 1:length(PT)
    if i == pos_max || i == 233 || i == pos_min
        if i == pos_max
            h1 = plot(X(i),Y(i),'o','MarkerFaceColor', 'k', 'MarkerEdgeColor','black','MarkerSize', 25);
        elseif i == 233
            h2 = plot(X(i),Y(i),'o','MarkerFaceColor', 'k', 'MarkerEdgeColor','black','MarkerSize', 20);
        elseif i == pos_min
            h3 = plot(X(i),Y(i),'o','MarkerFaceColor', 'k', 'MarkerEdgeColor','black','MarkerSize', 3.2);
        end
        scatter(X(i), Y(i), PNum(i) * size_mult, ...
                'MarkerEdgeColor','black',...
                'MarkerFaceColor',markerColour(i,:));
    end
end