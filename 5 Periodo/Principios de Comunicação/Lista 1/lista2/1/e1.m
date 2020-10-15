clc;clear all;close all;
t = [-300:1e-1:300]*1e-6;
m = 8*cos(1e4*pi*t);
c = 10*cos(2e5*pi*t);
plot(t,c,'Color','k');
hold on
plot(t,m,'Color','r','LineWidth',3);
legend('Portadora','Sinal modulante')
ylim([-15,15])
xticks([-300e-6:100e-6:300e-6])
xticklabels([-300:100:300])
title('Portadora e Sinal Modulante')
xlabel('Tempo ({\mu}s)')
ylabel('Portadora e sinal modulante (V)')
clear