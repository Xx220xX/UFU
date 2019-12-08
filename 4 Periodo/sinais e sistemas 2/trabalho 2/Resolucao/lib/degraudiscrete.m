function [n,y] = degraudiscrete(b,a,numN)
    n = 0:numN;
    y = eqdif(b,a,@u,n);
end
function out = u(n)
    out = 0;
    if n>=0 
        out = 1;
    end
end