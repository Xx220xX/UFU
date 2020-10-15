clc;clear;close all;addpath ('../lib');
b = [10 5];a = [1 2 5];
sys = tf(b,a);
%% resposta em frequencia
w = 0:0.1:20*2*pi;H = zeros(length(w),1);
for i=1:length(w)
    H(i) = evalfr(sys,w(i));
end
plot(w/(2*pi),20*log10(abs(H)));grid on;xlabel('freq (Hz)');ylabel('amplitude (dB)');
title('espectro do sistema');saveas(gcf,'out/espc.png');
%% resposta ao inpulso
[y,t]= impulse(sys,10);
figure;plot(t,y);grid on;title('resposta ao impulso');grid on;xlabel('tempo (s)');ylabel('h(t)');saveas(gcf,'out/imp.png');
%% resposta ao degrau
[y,t]= step(sys,10);
figure;plot(t,y);grid on;title('resposta ao degrau');xlabel('tempo (s)');ylabel('s(t)');saveas(gcf,'out/deg.png');
%%
overshoot(a)
b_novo = [5];
sys_novo = tf(b_novo,a);
H_novo = zeros(length(w),1);
for i=1:length(w)
    H_novo(i) = evalfr(sys_novo,w(i));
end
figure;plot(w/(2*pi),20*log10(abs(H_novo)));grid on;xlabel('freq (Hz)');ylabel('amplitude (dB)');
title('espectro do sistema novo');saveas(gcf,'out/espcnovo.png');
[y,t]= step(sys_novo,10);
figure;plot(t,y);grid on;title('resposta ao degrau do sistema novo');xlabel('tempo (s)');ylabel('s(t)');saveas(gcf,'out/degnovo.png');