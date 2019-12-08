clc;clear;close all;addpath ('../lib');
b = [1,0.25,-0.125];
a = [1,-1,0.25];
w = 0:0.1:pi;Y=ba2Hef(b,a,w);
%% a
figure;plot(w,abs(Y),'linewidth',2,'color',[0 0 0]);set(gca,'xlim',[0 pi]);set(gca,'xtick', 0:pi/4:pi);set(gca,'xticklabel', {'0','\pi/4','\pi/2','2\pi/3','\pi'});grid on;xlabel('Frequency (\Omega)');ylabel('Magnitude (linear) ');
title('espectro do sistema');saveas(gcf,'out/espctro.png');
%% c
[n,y]= degraudiscrete(b,a,30);
figure;plot(n,y,'linewidth',2,'color',[0.5 0 0]);grid on;xlabel('n');ylabel('Amplitude');ylim([0 5]);title('resposta ao degrau');
saveas(gcf,'out/stepresponse.png');