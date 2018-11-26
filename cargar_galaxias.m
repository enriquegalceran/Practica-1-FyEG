function [a2,stellarMass, max_lengthg, snapNum] = cargar_galaxias(nombre_archivo, a1)

a2 = tdfread(nombre_archivo,',');
% a1 = tdfread([nombre_archivo(1:end-4), '.txt'],',');
long_1 = length(a1.haloID);
long_2 = length(a2.haloID);
snapNum = a2.snapnum;
max_lengthg = length(snapNum);
% np = zeros(long_1,1);
% vmax = np;
% bulgeMass = np;
% coldGas = np;
% hotGas = np;
% ejectedMass = np;
% blackHoleMass = np;
for i = 2:long_2
    if snapNum(i) >= snapNum(i-1)
        long_1 = i-1;
        break
    end
end
stellarMass = a2.stellarMass(1:long_2);
for i = long_2-1:-1: 1
    if stellarMass(i)<stellarMass(i+1)
        stellarMass(i)=stellarMass(i+1);
    end
end
snapNum = snapNum(1:long_2);
for i = 1:long_1
    for j = 1:long_2
        if a1.haloID(i) == a2.haloID(j)
            stellarMass(i) = stellarMass(i) + a2.stellarMass(j);
%             np(i) = np(i) + a2.np(j);
%             vmax(i) = vmax(i) + a2.vmax(j);
%             bulgeMass(i) = bulgeMass(i) + a2.bulgeMass(j);
%             coldGas(i) = coldGas(i) + a2.coldGas(j);
%             hotGas(i) = hotGas(i) + a2.hotGas(j);
%             ejectedMass(i) = ejectedMass(i) + a2.ejectedMass(j);
%             blackHoleMass(i) = blackHoleMass(i) + a2.blackHoleMass(j);
        end
    end
end






end