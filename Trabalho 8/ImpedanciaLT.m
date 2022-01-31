%Irradiacao e Ondas Guiadas - Eng. Eletrica
%Plotar impedancia ao longo da linha
%31/01/2022
%Gabriel Arantes e Larissa Braga

%%
%Linha de transmissao em curto
clc;
clear all;
close all;

z01 = 50;
z02 = 200;

for n = 1:10e3
    y(n) = 100*(n-1)/10e3;
    z1(n) = z01*tan(y(n));
    z2(n) = z02*tan(y(n));
end

figure(1)
plot(y,z1), grid;
title('Linha em Curto: Z0 = 50 \Omega');
xlabel('Y');
ylabel('Reatancia');
axis([0 10 -2.5e3 2.5e3]);

figure(2)
plot(y,z2), grid;
title('Linha em Curto: Z0 = 200 \Omega');
xlabel('Y');
ylabel('Reatancia');
axis([0 10 -2.5e3 2.5e3]);

%%
%Linha de Transmissao Aberta
clc;
clear all;
close all;

z01 = 50;
z02 = 200;

for n = 1:10e3
    y(n) = 100*(n-1)/10e3;
    z1(n) = -z01*cot(y(n));
    z2(n) = -z02*cot(y(n));
end

figure(3)
plot(y,z1), grid;
title('Linha em Circuito Aberto: Z0 = 50 \Omega');
xlabel('Y');
ylabel('Reatancia');
axis([0 10 -2.5e3 2.5e3]);

figure(4)
plot(y,z2), grid;
title('Linha em Circuito Aberto: Z0 = 200 \Omega');
xlabel('Y');
ylabel('Reatancia');
axis([0 10 -2.5e3 2.5e3]);

%%
%Linha de Transmissao Casada
clc;
clear all;
close all;

z01 = 50;
z02 = 100;
zc1 = 50;
zc2 = 100;

for n = 1:10e3
    y(n) = 100*(n-1)/10e3;
    z1(n) = z02*(zc2+z02*tan(y(n)))/(z02+zc2*tan(y(n)));
    z2(n) = z01*(zc2+z01*tan(y(n)))/(z01+zc2*tan(y(n)));
    z3(n) = z02*(zc1+z02*tan(y(n)))/(z02+zc1*tan(y(n)));
end

figure(5)
plot(y,z1), grid;
title('Linha em Casada: Z0 = Zc = 100 \Omega');
xlabel('Y');
ylabel('Reatancia');
axis([0 10 -2.5e3 2.5e3]);

figure(6)
plot(y,z2), grid;
title('Linha Casada: Z0 = 50 \Omega e Zc = 100 \Omega');
xlabel('Y');
ylabel('Reatancia');
axis([0 10 -2.5e3 2.5e3]);

figure(7)
plot(y,z3), grid;
title('Linha Casada: Z0 = 100 \Omega e Zc = 50 \Omega');
xlabel('Y');
ylabel('Reatancia');
axis([0 10 -2.5e3 2.5e3]);
