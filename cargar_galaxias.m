function [a1,mcrit] = cargar_galaxias(nombre_archivo)

a1 = tdfread(nombre_archivo,',');
a2 = tdfread([nombre_archivo(1:end-4), 'G.txt'],',');
long_1 = length(a1.haloID);
long_2 = length(a2.haloID);

np = zeros(long_1,1);
vmax = np;
stellarMass = np;
bulgeMass = np;
coldGas = np;
hotGas = np;
ejectedMass = np;
blackHoleMass = np;



for i = 1:long_1
    for j = 1:long_2
        if a1.haloID(i) == a2.haloID(j)
            np(i) = np(i) + a2.np(j);
            vmax(i) = vmax(i) + a2.vmax(j);
            stellarMass(i) = stellarMass(i) + a2.stellarMass(j);
            bulgeMass(i) = bulgeMass(i) + a2.bulgeMass(j);
            coldGas(i) = coldGas(i) + a2.coldGas(j);
            hotGas(i) = hotGas(i) + a2.hotGas(j);
            ejectedMass(i) = ejectedMass(i) + a2.ejectedMass(j);
            blackHoleMass(i) = blackHoleMass(i) + a2.blackHoleMass(j);
        end
    end
end






end