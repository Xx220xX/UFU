addpath('../1/');
T = 6;
M = 3;
t = 0:1e-6:T;
y = exp(-abs(t/2)).*sin(2*pi*t).*rect((t-2)/4);

tp = [];
yp = [];
for i = -M:M-1
    tp = [tp t+T*i];
    yp = [yp y];
end
    

plot(tp,yp,'black','lineWidth',1.5);

fprintf('P = %f; E = %f',pot(y,T,1e-6),eg(y,1e-6));