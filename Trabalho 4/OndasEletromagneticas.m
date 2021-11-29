%Irradiacao e Ondas Guiadas - Eng. Eletrica
%Propagacao de ondas no Matlab
%30/11/2021
%Gabriel Arantes e Larissa Braga
clc;
clear all;
close all;
%% 
%Definicao das constantes
eps0 = 8.854e-12; %Permissividade eletrica no vacuo
u0 = 4e-7*pi; %Permeabilidade magnetica no vacuo
%% 
%Parametros da onda
f = 60; %Frequencia da onda [Hz]

w = 2*pi*f; %Frequencia da onda [rad/s]
E0 = 15; %Amplitude do campo eletrico
H0 = 10; %Amplitude do campo magneticok

%% 
%Parametros do meio
%O sigma determina se o meio e ou nao dispersivo
%Meio nao dispersivo: sigma = 0
%Meio dispersivo: sigma diferente de 0
sigma = 0*(10e2*w); 
%Obs - O paramentro em parenteses e um fator multiplicativo para facilitar a visualizacao do comportamento da onda no grafico. 
%Determinado de forma empirica
er = 1.2; %Permissividade eletrica relativa
ur = 1; %Permeabilidade magnetica relativa

%%
eps = er*eps0; %Permissividade eletrica
u = ur*u0; %Permissividade magnetica

v = 1/sqrt(eps*u);%Velocidade da onda
lambda = v/f; %Comprimento de onda

t = 0:0.01*(1/f):1e3*(1/f); %Vetor de periodo
z = 0:0.01*(1/f):1e3*(1/f); %Vetor da propagacao no eixo z
%% 
%Constante de propagacao do meio
k = sqrt(j*w*u*(sigma+j*w*eps));
a = real(k); %A parte real determina a constante de atenuacao alfa
b = imag(k); %A parte imaginaria determina o deslocamento de fase por unidade de comprimento ou tambem constante de fase
%% 
%Calculo dos Campos Eletromagneticos
E = E0*exp(-a*z).*cos(w*t-b*z);
H = H0*exp(-a*z).*cos(w*t-b*z);
%% 
%Plotagem do grafico
figure('units','normalized','outerposition',[0 0 1 1]); %Abrir grafico em tela cheia
Xline = animatedline('linewidth',2,'color','k');
Yline = animatedline('linewidth',2,'color','r');
Zline = animatedline('linewidth',2,'color','b');

grid on; hold on;
%Definicao do tamanho dos eixos
%Medidas escolhidas de forma empirica e proporcionais aos parametros da onda
axis([0 30/f -1.5*E0 1.5*E0 -1.5*H0 1.5*H0]);
view(45,20); %Definir o angulo de observacao da figura 3d

%Legenda dos eixos
xlabel("Direção de propagação")
ylabel("Campo Elétrico");
zlabel("Campo Magnético");

%Informacoes do grafico
legend("Direção de propagação","Campo Elétrico","Campo Magnético");
if sigma == 0
    title(["Propagação de Ondas Eletromagnéticas";'Meio Não Dispersivo \sigma = ',num2str(sigma/(10e2*w))]);
else
    title(["Propagação de Ondas Eletromagnéticas";'Meio Dispersivo \sigma = ',num2str(sigma/(10e2*w))]);
end
%% 
%Plotando o grafico de forma animada
for i=1:length(t)
    addpoints(Xline,t(i),0,0);
    addpoints(Yline,t(i),E(i),0);
    addpoints(Zline,t(i),0,H(i));
    drawnow;
    hold on
end

