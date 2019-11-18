clear; clc; close all;

%% definicao dos coeficientes do sistema proposta para tirar o ruido do sinal
b = [0.9666   -5.5058   13.3535  -17.6276   13.3535   -5.5058    0.9666];
a = [1.0000   -5.6315   13.5041  -17.6255   13.2018   -5.3823    0.9344];
print(a,b)
%% importa a musica e mostra seu espectro
[sinal, Fs] = audioread('sinal_questao4.wav');
%[sinal, Fs] = audioread('arquivo_gerado_musica_filtrada_q4.wav');

%% plota espectro (caso voce queira ver)
numero_amostras_sinal = length(sinal);
eixo_n = (0:numero_amostras_sinal-1);  
eixo_tempo = eixo_n*(1/Fs) ;  %estou aplicando a formula t=n*Ts onde Ts=1/Fs
espectro_sinal = fft(sinal);
eixo_frequencia_sinal = eixo_n*(Fs/numero_amostras_sinal); % esta parte não é estudada no nosso curso
espectro_de_magnitude = abs(espectro_sinal);
plot(eixo_frequencia_sinal, espectro_de_magnitude); title('espectro Sinal A'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');


%% faz filtragem:
musica_filtrada = filter(b, a, sinal);
%% gera outro audio

audiowrite('arquivo_gerado_musica_filtrada_q4.wav',musica_filtrada,Fs);
%% roubar e add freq
clear all;
[sinal, Fs] = audioread('sinal_questao4.wav');

eixo_n = (0:length(sinal)-1);  
fq = 2200;
sb = 0.5*cos(2*pi*fq*eixo_n/Fs)';
sb = sb';
audiowrite('rc.wav',sb,Fs);
display('finish')