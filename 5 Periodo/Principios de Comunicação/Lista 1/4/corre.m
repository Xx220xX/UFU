function p=corre(x,y,dt)
    p = x*y'*dt/sqrt(eg(x,dt)*eg(y,dt));
end