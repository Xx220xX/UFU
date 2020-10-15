clc;clear all;close all;
FS = 1e6;
t = [-300e-6:1/FS:300e-6];
m = 8*cos(1e4*pi*t);
c = 10*cos(2e5*pi*t);
R1 = 220;R2 = 220;R3 = 10e3;
VP1 = (R2*c+R1*m)/(R1+R2+R1*R2/R3);
VP2 = max(VP1,0.3);VP2 = VP2*.24 +.015*VP2.^2;
Fp1 = fft(VP1)/length(VP1);Fp2 = fft(VP2)/length(VP2);
frequencia = [0:length(Fp1)-1]/(length(Fp1)-1)*FS;
L = 20e-6;C =130e-9;R5 = 47;
w = frequencia*2*pi;
H = (1j*w)./(-(w.^2)*R5*C + 1j*w+R5/L);
espectro_saida = H.*Fp2;
dsb = ifft(espectro_saida)*length(espectro_saida);

%%% eliminar parte imaginaria
dsb = real(dsb);

% 1
Av = 3/max(dsb);
sinal_em_P2 = dsb*-Av;


%% 2 passa pelo diodo

s_diodo = max(sinal_em_P2 -0.3,0);

plot(t/1e-6,s_diodo,'color','k')
ylim([-0.5 3.5])
title('Sinal de saída no diodo')
xlabel('Tempo ({\mu}s)')
ylabel('Sinal de saída no diodo')


%% 3 calcular fft positiva
f_diodo = fft(s_diodo)/length(s_diodo);

e3ao5(10e-9,w,frequencia,t,f_diodo,0)

e3ao5(1e-9,w,frequencia,t,f_diodo,1)

e3ao5(120e-9,w,frequencia,t,f_diodo,120)