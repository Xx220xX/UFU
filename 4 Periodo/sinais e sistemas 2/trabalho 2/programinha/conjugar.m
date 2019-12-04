function y=conjugar(inp)
    y = [];
    x = [];
    for i=inp
        y = [y i];
        x = [x conj(i)];
    end
    y = [y x];
    
end
