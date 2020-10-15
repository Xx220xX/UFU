clc;clear all;close all;
t = [-300:1e-1:300]*1e-6;
m = 8*cos(1e4*pi*t);
c = 10*cos(2e5*pi*t);
R1 = 220;
R2 = 220;
R3 = 10e3;
%(c - VP1)/R1+ (m-VP1)/R2 = VP1/R3;// aproximadamente
%(R2*c - vp1 *r2 + r1*m - r1*vp1 = vp1*r1r2/r3
%VP1*(R1+R2+R1*R2/R3)= R2c+R1*m
VP1 = (R2*c+R1*m)/(R1+R2+R1*R2/R3);
VP2 = max(VP1,0.3);
VP2 = VP2*.24 +.015*VP2.^2; 

plot(t,VP1,'Color',[0 0 0])
xticks([-300e-6:100e-6:300e-6])
xticklabels([-300:100:300])
ylim([-15,15])
xlabel('Tempo ({\mu}s)')
ylabel('Sinal de saída no somadore(V)')

figure;
plot(t,VP2,'Color',[0 0 0])
ylabel('sinal de saída do diodo')
xticks([-300e-6:100e-6:300e-6])
xticklabels([-300:100:300])
xlabel('Tempo ({\mu}s)')
ylim([-1,4])
