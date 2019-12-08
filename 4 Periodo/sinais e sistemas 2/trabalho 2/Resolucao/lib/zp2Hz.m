function f = zp2Hz(zeros,polos,w,ganho)
    num = 1;
    denominador = 1;
    for i=0:max(length(zeros)-1,length(polos)-1)
        num = num .*(1 - getValue(zeros,i)*exp(-1j*w));
        denominador = denominador.*(1 - getValue(polos,i)*exp(-1j*w));
    end	
    f = ganho*(num ./ denominador);
end
