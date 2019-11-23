clc;
clear;
close all;
%% abrir arquivo
[sinal, fs] = audioread('input/outs2.ogg');
%% multiplicar
audiowrite(sprintf('out/audio_com_ganho_%.3f.ogg',1.5),sinal*1.5,fs);
audiowrite(sprintf('out/audio_com_ganho_%.3f.ogg',5),sinal*5,fs);
