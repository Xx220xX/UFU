clc;clear all;close all;
%% 1.3
FS = 1e6;% 10 vezes a maior frequencia
t = [-300e-6:1/FS:300e-6];
m = 8*cos(1e4*pi*t);
c = 10*cos(2e5*pi*t);
R1 = 220;R2 = 220;R3 = 10e3;
VP1 = (R2*c+R1*m)/(R1+R2+R1*R2/R3);
VP2 = max(VP1,0.3);
VP2 = VP2*.24 +.015*VP2.^2;
Fp1 = fft(VP1)/length(VP1);
Fp2 = fft(VP2)/length(VP2);
%F = FS/2;
frequencia = [0:length(Fp1)-1]/(length(Fp1)-1)*FS;
plot(frequencia/1e3,abs(Fp1),'Color','k')
ylim([0 5])
xlim([0 151])
xlabel('Freq(kHz)')
ylabel('Sinal do somador')
title('Espectro de amplitude do sinal na saída do somador')

figure;
plot(frequencia/1e3,abs(Fp2),'Color','k')
xlim([0,500])
hold on
%% Equacionamento do filtro
%V - ir*R5 - Vc = 0
%ir = ic - il
%V - (ic - il)*R5 - Vc = 0
%V' = CR Vc" +Vc' + R/L Vc
L = 20e-6;
C =130e-9;
R5 = 47;
w = frequencia*2*pi;
H = (1j*w)./(-(w.^2)*R5*C + 1j*w+R5/L);
plot(frequencia/1e3,abs(H),'--','Color','r')
legend('Sinal do diodo','|Av|')
xlabel('Freq(kHz)')
title('Espectro de amplitude do sinal na saída do diodo')
ylabel('Espectros normalizados')
ylim([0 1.21])

%% 1.4
figure;
espectro_saida = H.*Fp2;
plot(frequencia/1e3,abs(espectro_saida),'Color','k')
xlabel('Freq(kHz)')
title('Espectro do sinal de saída')
ylabel('Sinal AM-DSB Normalizado')
ylim([0 1.21])
xlim([0 250])

%% 1.5
figure
dsb = ifft(espectro_saida);
plot(t,dsb*length(espectro_saida));
xticks([-300e-6:100e-6:300e-6]);xticklabels([-300:100:300]);
title('Sinal AM')
xlabel('Tempo ({\mu}s)')
title('Espectro do sinal de saída')
ylabel('Sinal AM-DSB(V)')
