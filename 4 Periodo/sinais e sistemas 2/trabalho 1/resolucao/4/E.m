clc;
clear;
close all;
%% abrir arquivo
[sinal, fs] = audioread('input/outs2.ogg');
%% salvar arquivo
audiowrite(sprintf('out/audio_por_menos_1.ogg',1.5),sinal,fs);
%% 
sinal=sinal(1:floor(fs/100));
Yo = fft(sinal);
sinal = sinal*-1;

%% analise de espectro

Y = fft(sinal);
n = 0:length(Y)-1;
freq = n*(fs/length(sinal));
figure;
subplot(2,1,1); plot(n/fs, abs(Yo)); title('Amplitude do Espectro Sinal original' ); xlabel('Freq (Hz)'); ylabel('Amplitude');
subplot(2,1,2); plot(freq, abs(Y));  title('Amplitude do Espectro Sinal modificado'); xlabel('Freq (Hz)'); ylabel('Amplitude');
saveas(gcf,'out/ampmenos1.png');
figure;
subplot(2,1,1); plot(n/fs, angle(Yo)*180/pi); title('Fase do Espectro Sinal original' ); xlabel('Freq (Hz)'); ylabel('Angulo °');
subplot(2,1,2); plot(freq, angle(Y)*180/pi);  title('Fase do Espectro Sinal modificado'); xlabel('Freq (Hz)'); ylabel('Angulo °');
saveas(gcf,'out/fasemenos1.png');    