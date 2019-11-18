clc;
clear all;
close all;
figure;
fs = 12e3; %frequencia de amostragem, a maior frequencia do sinal é 5kHz
n=0:0.01*fs; %vetor n
t = n/fs; %  vetor t = n*ts
%% a) - 
x = 5*sin(2*pi*1e3*t) +2*sin(2*pi*3e3*t) +0.5*cos(2*pi*5e3*t);
subplot(2,1,1);plot(t, x); title('Sinal X(t)'); xlabel('tempo (s)'); ylabel('Amplitude'); 
w = n*(fs/length(x));
h = fft(x);
subplot(2,1,2);plot(w, abs(h)); title('espectro Sinal X(t)'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
%% b)-
figure;
f = [2.8e3 2.9e3 3.1e3 3.2e3 4.9e3 5e3];% distancias da transicoes
a = [1 0 1 0];         % porcentagem de amplitudes desejadas
od = 1e-3;
dev = [od od od od]; % ondulacao permitida
[n, fo, ao, w] = firpmord (f, a, dev, fs);
sist = firpm (n, fo, ao, w);
freqz (sist, 1.1024, fs)
title ( 'Filtro para frequências de 3kHz e 5kHz' )

%% c)-
y = conv(x,sist,'same');

