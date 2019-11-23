clear; clc; close all;

%% PASSO 1: importa a musica e mostra seu espectro
[sinal, Fs] = audioread('input/sinal_questao4.wav');

%% PASSO 2: plota espectro (caso voce queira ver)

eixo_n = (0:length(sinal)-1);  
eixo_tempo = eixo_n*(1/Fs) ;  
espectro_sinal = fft(sinal);
eixo_frequencia_sinal = eixo_n*(Fs/length(sinal)); % esta parte não é estudada no nosso curso
figure; plot(eixo_frequencia_sinal, abs(espectro_sinal)); title('espectro do Sinal'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
saveas(gcf,'out/espectroOriginal','png');
%% PASSO 3: projeta os coeficientes dos filtros. Sao dois filtros no caso. Filtro 1 e 2. 
% passo 3.1: projeta filtro 1
[n,fo,ao,w] = firpmord([2000  2200  2210 2410],[1 0 1 ],[0.01 0.1 0.01],Fs);
b1 = firpm(n,fo,ao,w);
a1 = [1];
figure; %freqz(b1,a1,1000, Fs); title('sistema 1');

saveas(gcf,'out/sistema1','png');
% passo 3.2: projeta filtro 2
wp1= 2000/(Fs/2);
ws1= 2200/(Fs/2);
ws2= 2210/(Fs/2);
wp2= 2410/(Fs/2);
[n, wn]=buttord([wp1 wp2], [ws1 ws2], 1, 20);
[b2, a2]= butter(n,wn,'stop');
figure; freqz(b2, a2, 1000, Fs); title('sistema 2');
saveas(gcf,'out/sistema2','png');
%% PASSO 4: faz filtragem usando o sistema 1 (coeficientes a1 e b1) e sistema 2 (coeficientes a2 e b2)
musica_filtrada_sis1 = filter(b1, a1, sinal);
musica_filtrada_sis2 = filter(b2, a2, sinal);


%% PASSO 5: gera audio filtrado pelos respectisos sistemas
musica_filtrada_sis1 = musica_filtrada_sis1./(max(abs(musica_filtrada_sis1)));
musica_filtrada_sis2 = musica_filtrada_sis2./(max(abs(musica_filtrada_sis2)));
audiowrite('out/arquivo_gerado_musica_filtrada_q4_sis1.ogg',musica_filtrada_sis1,Fs);
audiowrite('out/arquivo_gerado_musica_filtrada_q4_sis2.ogg',musica_filtrada_sis2,Fs);

%% Deslocar as frequencias

% clear -regexp  '[^[(sinal)|(eixo_frequencia_sinal)|(tam)|(Fs)]]'
% %clear a1 a2 ao b1 b2 eixo_tempo fo 
% close all;
% figure;
% progress = waitbar(0,'calculando');
% mx = 44;
% for i=0:mx
% subplot(mx+1,1,i+1)
% fd = i*1e3;
% wo = fd*2*pi/Fs;
% k =  exp(1j*eixo_n*wo);
% y = sinal .*k';
% Y = fft(y);
% plot(eixo_frequencia_sinal, abs(Y)); title(['espectro deslocado para ' int2str(i)] ); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
% name = ['out/sinal' int2str(i) 'k.ogg'];
% audiowrite(name,y,Fs);
% waitbar(i/mx,progress,'calculando');
% end
% close(progress);

