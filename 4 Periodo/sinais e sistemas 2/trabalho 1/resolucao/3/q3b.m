clc;
clear;
close all;
[sinal, fs] = audioread('input/sinal_questao3b.wav');
analisaTmp(sinal,fs,[2100,2800]);
analisaTmp(sinal,fs,[3700,4500]);
analisaTmp(sinal,fs,[5300,6000]);
analisaTmp(sinal,fs,[6900,7600]);
analisaTmp(sinal,fs,[8400,9300]);
analisaTmp(sinal,fs,[10100,10800]);


function analisaTmp(sinal,fs,Tempo)
    figure;
    %disp(sprintf('%.3f - %.3f & %d %d & x - x',Tempo(1)/fs,Tempo(2)/fs,Tempo(1),Tempo(2)));
    s1 = sinal(Tempo(1):Tempo(2));% separando faixa de tempo
    n1 = 0:length(s1)-1;
    S1 = abs(fft(s1));
    f1 = n1*(fs/length(s1));
    subplot(2,1,1); plot(n1/fs, s1); title(sprintf('Sinal entre %.3f e %.3f s',Tempo(1)/fs,Tempo(2)/fs)); xlabel('tempo (s)'); ylabel('Amplitude');
    subplot(2,1,2); plot(f1, S1);  title('espectro Sinal nesta faixa'); xlabel('Freq (Hz)'); ylabel('Amplitude (linear)');
    saveas(gcf,sprintf('out/analise_N__%d_%d_.png',Tempo(1),Tempo(2)));
end