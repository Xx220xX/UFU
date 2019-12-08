function y = eqdif(b,a,x,n)
    y = zeros(length(n),1);
    a =a/a(1);
    for i=n
        for j=0: max(length(a)-1,length(b)-1)
         y(i+1) = y(i+1) - getValue(a,j+1)*getValue(y,i-(j+1)) + getValue(b,j)*getValue(x,i-j) ;    
        end     
    end
end
