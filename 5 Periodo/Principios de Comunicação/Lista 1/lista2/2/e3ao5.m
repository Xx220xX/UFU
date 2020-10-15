function   e3ao5(C,w,frequencia,t,f_diodo,mostrar)
% filtro passa baixa
R4 = 2.7e3;
figure
plot(frequencia/1e3,abs(f_diodo),'color','k')
ylim([0 1.21])
xlim([-10 500])
xlabel('Frequencia (kHz)')
ylabel('Expectro Normalizado')
title('Espectro de amplitude so sinal na saída do diodo');
H = 1./(R4*C*1j*w + 1);
hold on;
plot(frequencia/1e3,abs(H),'--','color','r')
legend('Sinal do diodo','|Av|')
if (mostrar !=0)
title(['Espectro de amplitude so sinal na saída do diodo ' sprintf('capacitor de %g nF',mostrar)] )
end
% passar pelo filtro
figure;
espectro_filtrado = f_diodo.*H;
plot(frequencia/1e3,abs(espectro_filtrado),'color','k')
xlim([-5 250])
ylim([0 0.81])
xlabel('Frequencia (kHz)')
ylabel('Sinal Demodulado')
title('Espectro sinal de saída');
if (mostrar !=0)
title(['Espectro sinal de saída ' sprintf('capacitor de %g nF',mostrar)] )
end
%% transformada inversa 
figure;
sinal = ifft(espectro_filtrado)*length(espectro_filtrado);
sinal = real(sinal);
plot(t/1e-6,sinal,'color','k')
ylim([-1.51 1.51])
title('Sinal demodulado')
if (mostrar !=0)
title(['Sinal demodulado ' sprintf('capcitor de %g nF',mostrar)] )
end
end
