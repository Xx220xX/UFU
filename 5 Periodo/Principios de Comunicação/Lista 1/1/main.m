clc;
clear;
t  = -2:1e-6:2;
x1 = u(t);
x2 = rect(t);
x3 = delta(t);


figure()
title('sinais basicos');
myplot(t,x1,1,'sinal u(t)');
myplot(t,x2,2,'sinal rect(t)');
myplot(t,x3,3,'sinal delta(t)');

function myplot(t,x,n,titulo)
    subplot(3,1,n);
    plot(t,x,'black','LineWidth',1.5);
    ylim([-0.5 1.5]);
    title(titulo);
end
    
    
    