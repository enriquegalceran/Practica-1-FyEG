nombre_archivo = 'arbol mas grande menor de 1000.txt';
a = tdfread(nombre_archivo,',');

X = a.x;
Y = a.y;
Z = a.z;
SN = a.snapNum;
max_length = length(SN);
Matriz = zeros(63,100, 3); %(tiempo, i, X/Y/Z)
contador_SN = zeros(1,63);

for i = 1:max_length
    snap = SN(i);
    contador_SN(snap) = contador_SN(snap) + 1;
    instancia = contador_SN(snap);
    Matriz(snap, instancia, 1) = X(i);
    Matriz(snap, instancia, 2) = Y(i);
    Matriz(snap, instancia, 3) = Z(i);
end
figure(1)
hold on

lim_X1 = Matriz(:,:,1);
lim_X1(lim_X1==0) = [];
lim_X = [max(max(lim_X1)) min(min(lim_X1))];
lim_X1 = Matriz(:,:,2);
lim_X1(lim_X1==0) = [];
lim_Y = [max(max(lim_X1)) min(min(lim_X1))];
lim_X1 = Matriz(:,:,3);
lim_X1(lim_X1==0) = [];
lim_Z = [max(max(lim_X1)) min(min(lim_X1))];

for t = 1:63
    clf
    
    Xd = Matriz(t,:,1);
    Yd = Matriz(t,:,2);
    Zd = Matriz(t,:,3);
    plot3(Xd,Yd,Zd,'.')
%     xlim(lim_X)
%     ylim(lim_Y)
%     zlim(lim_Z)
%     axis([lim_X, lim_Y, lim_Z])
    pause(0.05)
end
