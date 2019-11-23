clc;
clear;
close all;

fs = 210.2e3; %frequencia de amostragem, a maior frequencia do sinal � 5kHz
n=0:0.01*fs; %vetor n   
t = n/fs; %  vetor t = n*ts
figure;
x = 5*sin(2*pi*1e3*t) +2*sin(2*pi*3e3*t) +0.5*cos(2*pi*5e3*t);
% subplot(2,1,1);plot(t, x); title('Sinal X(t)'); xlabel('tempo (s)'); ylabel('Amplitude'); 
w = n*(fs/length(x));
h = fft(x);
subplot(3,1,1);stem(w, abs(h)); title('espectro Sinal X(t)'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');


%% deslocar 101k
x101 =  x.*exp(2j*pi*101e3*t);
frq101 = n*fs/length(x101);
X101 = fft(x101);
subplot(3,1,2);stem(frq101, abs(X101)); title('espectro Sinal X(t) deslocado para 101k'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');

%% deslocar 105k
x105 =  x.*exp(2j*pi*105e3*t);
frq105 = n*fs/length(x105);
X105 = fft(x105);
subplot(3,1,3);stem(frq105, abs(X105)); title('espectro Sinal X(t) deslocado para 105k'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
%% salvar  imagem
saveas(gcf,'out/espectros.png')
