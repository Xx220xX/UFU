clc;
clear;
close all;
%% a
[voz, fsV] = audioread('input/u1s.ogg');
nV = (0:length(voz)-1);  
VOZ = fft(voz);
freqV = nV*(fsV/length(voz));
% retirando simetria do espectro
freqV = freqV(1:floor(length(freqV)/2));
VOZ = VOZ(1:floor(length(VOZ)/2));
figure;
stem(freqV,abs(VOZ));  title('espectro da voz'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
saveas(gcf,'out/espectrovoz.png');
figure;
freqV = freqV(1:5e3);
VOZ =VOZ(1:5e3);
stem(freqV,(abs(VOZ)));  title('espectro da voz'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
saveas(gcf,'out/espectrovozcut.png');
%% b
% tempo da musica de 1min 2 seg uo up :D
% audiowrite('out/teste.ogg',voz,fsV);
[music,fsM]= audioread('input/Pumped Up Kicks (Instrumental).mp3');music = music(1:(20*fsM),1);
[voz, fsV] = audioread('input/u.mp3');voz = voz(1:3*fsV,1);
voz = [zeros(1,5*fsM) voz' zeros(1,5*fsM) voz' zeros(1,length(music)-2*length(voz)-10*fsM )];
voz = voz/max(abs(voz));
music = music/max(abs(music));
out = (voz+music')';
out = out/max(abs(out));
audiowrite('out/m_v.ogg',out,fsM);
% espectro
nM = (0:length(out)-1);  
MUSIC = fft(music);
freqM = nM*(fsM/length(music));
figure;
stem(freqM(1:floor(length(freqM)/2)),abs(MUSIC(1:floor(length(MUSIC)/2))));  title('espectro da musica'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
saveas(gcf,'out/espectromusica.png');

nO = (0:length(out)-1);  
OUT = fft(out);
freqO = nO*(fsM/length(out));
figure;
stem(freqO(1:floor(length(freqO)/2)),abs(OUT(1:floor(length(OUT)/2))));  title('espectro da voz + musica'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
saveas(gcf,'out/espectrosoma.png');

