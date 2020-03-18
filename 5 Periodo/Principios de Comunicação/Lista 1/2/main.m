addpath('../1/')
close all;
clc; clear;
t  = -2:1e-2:3;
s1 = exp(-t);
s2 = sin(6*pi*t);
s3 = u(t+1);
y  = s1.*s2.*s3;

figure;
myplot(t,s1,1,'sinal e^{-t}',[-2 2]);
myplot(t,s2,2,'sinal sin(6{pi}*t))',[-2 2]);
myplot(t,s3,3,'sinal u(t+1)',[-0.5 1.5]);

figure;
myplot1(t,y,'Sinal e^{-t}*sin(6pi*t)*u(t+1)',[-3 3]);

function myplot(t,x,n,titulo,yl)
    subplot(3,1,n);
    myplot1(t,x,titulo,yl)
end
function myplot1(t,x,titulo,yl)
    plot(t,x,'black','LineWidth',1.5);
    ylim(yl);
    title(titulo);
end