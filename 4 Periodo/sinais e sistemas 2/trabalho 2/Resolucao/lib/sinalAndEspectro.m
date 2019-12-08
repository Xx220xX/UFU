function sinalAndEspectro(x,t,n,fs,titulo,xt,yt,name,pl,newfig,endplot)
    if ~exist('endplot','var')
        endplot= '';
    end
    if ~exist('newfig','var') || newfig
        figure;
    end
    subplot(2,1,1);eval(sprintf("%s(t, x%s);",pl,endplot)); title(titulo); xlabel(xt); ylabel(yt); 
    f = (n(1:floor(length(n)/2)))*fs/length(x);X = fft(x);X = X(1:floor(length(X)/2));
    subplot(2,1,2);eval(sprintf("%s(f*1e-3, abs(X)%s); title(['espectro ' titulo]); xlabel('Freq (KHz)'); ylabel('Amplitude (linear)')",pl,endplot));
    saveas(gcf,['out/' name '.png']);
end