function a = getValue(vet,n)
    a= 0;
    if n>=0 && n<length(vet)||  isa(vet, 'function_handle')
        a= vet(n+1); 
    end
end

