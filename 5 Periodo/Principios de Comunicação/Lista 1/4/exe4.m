function exe4(default,t,sig,dt,id)
    subplot(2,3,id);
    y =  default;
    y = eval(sig);
    plot(t,y,'k','LineWidth',1.5); 
    ylabel(sprintf('g{_%d}(t)',id));xlabel('t');
    ylim([-1.5 1.5]);grid on;
    title(sprintf('p = %f',corre(default,y,dt)))
end