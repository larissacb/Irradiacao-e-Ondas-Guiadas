%Irradiacao e Ondas Guiadas - Eng. Eletrica
%Coeficientes de transmissão e reflexão
%23/12/2021
%Gabriel Arantes e Larissa Braga

%Meio dispersivo
%Polarizacao perpendicular e paralela
%Incidencia externa (Er1<Er2)

clc;
clear all;
close all;

f = 25e8;
w = 2*pi*f;
E0 = 8.854e-12;
u0 = 1*pi*4e-7;
u1 = u0;
u2 = u0;
Er1 = 1;
Er2 = 5+j;
E1 = E0*Er1;
E2 = E0*Er2;

n0 = sqrt(u0/E0);
n1 = sqrt(u0/E1);
n2 = sqrt(u0/E2);

k1 = w*sqrt(u0*E1);
k2 = w*sqrt(u0*E2);

tetai = 0:90; %angulo incidente

for i=1:length(tetai)
  tetat(i) = acos(sqrt(1-(k1*sin(tetai(i)*pi/180)/k2)^2));  %ângulo transmitido
  Rperp(i) = (n2*cos(tetai(i)*pi/180)-n1*cos(tetat(i)*pi/180))/(n2*cos(tetai(i)*pi/180)+n1*cos(tetat(i)*pi/180));
  Rpara(i) = (n1*cos(tetai(i)*pi/180)-n2*cos(tetat(i)*pi/180))/(n1*cos(tetai(i)*pi/180)+n2*cos(tetat(i)*pi/180));
  Tperp(i) = 2*n2*cos(tetai(i)*pi/180)/(n2*cos(tetai(i)*pi/180)+n1*cos(tetat(i)*pi/180));
  Tpara(i) = 2*n2*cos(tetai(i)*pi/180)/(n1*cos(tetai(i)*pi/180)+n2*cos(tetat(i)*pi/180));  
end

figure (1);
subplot(2,2,1);
plot(tetai, abs(Rperp), 'm', 'LineWidth', 2), grid;
hold on;
plot(tetai, abs(Rpara), 'k', 'LineWidth', 2);
hold on;
xlabel('\theta_i (graus)');
ylabel('Módulo');
legend('Pol. Perpendicular', 'Pol. Paralela');
title('Coeficiente de transmissão'); 
title('Coeficiente de reflexão');

subplot(2,2,2);
plot(tetai, abs(Tperp), 'm', 'LineWidth', 2), grid;
hold on;
plot(tetai, abs(Tpara), 'k', 'LineWidth', 2);
legend('Pol. Perpendicular', 'Pol. Paralela');
hold on;
xlabel('\theta_i (graus)');
ylabel('Módulo');
title('Coeficiente de transmissão');  

subplot(2,2,3);
plot(tetai, rad2deg(-angle(Rperp)), 'm', 'LineWidth', 2), grid;
hold on;
plot(tetai, rad2deg(-angle(Rpara)), 'k', 'LineWidth', 2);
hold on;
xlabel('\theta_i (graus)');
ylabel('Fase (graus)');
legend('Pol. Perpendicular', 'Pol. Paralela');
title('Coeficiente de reflexão');

subplot(2,2,4);
plot(tetai, rad2deg(-angle(Tperp)), 'm', 'LineWidth', 2), grid;
hold on;
plot(tetai, rad2deg(-angle(Tpara)), 'k', 'LineWidth', 2); 
hold on;
set(gca,"ylim",[1,181]);
xlabel('\theta_i (graus)');
ylabel('Fase (graus)');
legend('Pol. Perpendicular', 'Pol. Paralela');
title('Coeficiente de transmissão'); 
suptitle('Incidência Externa - Meios Dispersivos');