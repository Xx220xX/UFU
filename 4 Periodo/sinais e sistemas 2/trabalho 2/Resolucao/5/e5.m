close all;clear all; clc;
t_fornecido = [0.1 0.2 0.3 0.4 0.5 1.0 1.5 2.0 2.5 3.0 4.0];
y_fornecido = [0.005 0.034 0.085 0.140  0.215 0.510 0.700 0.817 0.890 0.932 0.975];
plot(t_fornecido,y_fornecido);

%% Aproximacao
% 
% y = ax + b

x = t_fornecido;
y = log10(1 - y_fornecido); 
a = sum(x.*(y - median(y)))/sum(x.*(x - median(x)));
b = median(y)-a*median(x);
alpha = a/(-log10(exp(1)));
A  = -10^b;
disp(alpha);
disp(A);

%% segundo termo 
%calculos analiticos. beta = (-0.48 +1.7)/(0.5*LOG10(e))
B = 0.33;
beta = 5.8;
%% finish
y_final = 1+ A*exp(-alpha*x) + B*exp(-beta*x);
%% Grafico comparativo
figure;hold on;
plot(t_fornecido,y_fornecido);
plot(t_fornecido,y_final);
title('Comparação entre aproximação e dados obtidos');
saveas(gcf,'out/comp.png');

%% espectro 
figure;
f = 0:0.01:10000;
s = f*2*pi*1j;
G = (0.0058*s.^2-0.558070*s +5.76636)./(s.*(s+5.8).*(s+0.9942));
subplot(2,1,1);
semilogx (f,20*log10(abs(G)));title('Grafico de Bode do sistema');grid minor;ylabel('amplitude dB');xlabel('freq (Hz)');
subplot(2,1,2);
plot(f,phase(G)*180/pi+180);grid minor;ylabel('Phase °');xlabel('freq (Hz)');xlim([0 100]);
saveas(gcf,'out/bode.png');

