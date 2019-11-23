function s = print(a,b)

    s = '';
    for i = 1:length(a)
        s = sprintf('%s + %g y[n-%d]',s,a(i),i-1);
    end
    x = '';
    for i = 1:length(b)
        x = sprintf('%s + %g x[n-%d]',x,b(i),i-1);
    end
    s = [s(4:length(s)) ' = '  x(4:length(x))];
   
end
