clc;clear;close all; addpath ('../lib');
fs = 12e3; %frequencia de amostragem, a maior frequencia do sinal � 5kHz
n = 0:0.015*fs; %vetor n   
t = n/fs; %  vetor t = n*ts
%% filtro  Valores estraidos do programinha zsurface
zeros = [0.001488+0.9996j,0.001488-0.9996j,-0.00164+0.9994j,-0.00164-0.9994j]';
polos =[-0.01232+0.9695j,-0.01232-0.9695j,0.01311+0.971j,0.01311-0.971j]';
ganho = 0.2/(5+0.5);%multiplicador do sinal. 
%% fazer sinal x
x = 5*sin(2*pi*1e3*t) +2*sin(2*pi*3e3*t) +0.5*cos(2*pi*5e3*t);% sinal x
sinalAndEspectro(x,t,n,fs,'Sinal X','tempo(s)','Amplitude linear','sinal_xp','plot',true);%plotar sinal
sinalAndEspectro(x,t,n,fs,'Sinal X','tempo(s)','Amplitude linear','sinal_xs','stem',true);%plotar sinal
%% sistema
figure;
w = 0:0.01:pi;
H = zp2Hz(zeros,polos,w,ganho);
plot(w, 20*log10(abs(H)),'linewidth',2,'color',[0 0 0]);set(gca,'xlim',[0 pi]);set(gca,'ylim',[-30 -28]);set(gca,'xtick', 0:pi/4:pi);set(gca,'xticklabel', {'0','\pi/4','\pi/2','2\pi/3','\pi'});grid on;xlabel('Frequency (\Omega)');ylabel('Magnitude (dB) ');
saveas(gcf,'out/espectro_sistema.png');
%% filtrar
[b,a]=zp2tf(zeros,polos,1);
b = b* ganho;
y = eqdif(b,a,x,n);
sinalAndEspectro(y,t,n,fs,'Sinal filtrado','tempo(s)','Amplitude linear','sinal_x_filtradop','plot',1);%plotar sinal
sinalAndEspectro(y,t,n,fs,'Sinal filtrado','tempo(s)','Amplitude linear','sinal_x_filtrados','stem',1);%plotar sinal
%% plotar saida e 

sinalAndEspectro(y,t,n,fs,'','tempo(s)','Amplitude linear','comp','hold on;plot',true,',"r"');%plotar sinal
sinalAndEspectro(x,t,n,fs,'','tempo(s)','Amplitude linear','comp','plot',false);%plotar sinal
subplot(2,1,1);
title('sinal');
saveas(gcf,'out/comp.png')

hold off;
