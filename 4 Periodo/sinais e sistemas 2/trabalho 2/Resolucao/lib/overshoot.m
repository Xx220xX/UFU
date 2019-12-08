function M_p= overshoot(a)
    if ~length(a)==2
        error('o sistema nao é de segunda ordem');
    end
    a = a/a(1);
    z = a(2)/(2*sqrt(a(3)));
    M_p = exp(-pi*z/(sqrt(1-z^2)));
end