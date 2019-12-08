function f = ba2Hef(b,a,w)
   num = 0;den=0;
   for i=0:length(b)-1
       num = num + b(i+1).*exp(-i*1j*w);
   end
   for i=0:length(a)-1
       den =den + a(i+1).*exp(-i*1j*w);
   end
   f= num./den;
end