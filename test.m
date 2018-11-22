%test

% PNum2 = log10(PNum)+min(log10(PNum));
% figure(5)
% colormap jet
% scatter(X,Y,PNum*20,Y,'.')
% colorbar

figure(20)
A = 1:1000;
scatter(A,A,A,A,'filled')
% colorbar












%Pregunta de internet
% N_subj = 30;
% X = rand(30,20);
% Y = rand(30,20);
% for i_subj=1:N_subj
%   x = X(i_subj,:);
%   y = Y(i_subj,:);
%   hold on
%   markerColour = i_subj/N_subj;
%   markerColour = [markerColour markerColour markerColour];
%   colormap summer
%   h(i_subj)=scatter (x, y, ...
%     'MarkerEdgeColor','black',...
%     'MarkerFaceColor',markerColour);
% end
% colorbar

%Respuesta de internet
figure
N_subj = 30;
X = rand(30,20);
Y = rand(30,20);
% Create colormap with N_subj colors.
summerColorMap = summer(N_subj);
for i_subj=1:N_subj
  x = X(i_subj,:);
  y = Y(i_subj,:);
  hold on
  % Get the color for this subject from the summer colormap.
  markerColour = summerColorMap(i_subj,:);
  h(i_subj)=scatter (x, y, ...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',markerColour);
end
% Display colorbar.
colormap(summerColorMap);
colorbar




