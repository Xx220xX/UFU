vl = float(input('VL rms:'))
il = float(input('IL rms:'))
fp = float(input('fp:'))
from math import *

s = sqrt(3)*vl*il
p = s*fp
q = sqrt(s**2 - p**2)
def show1(v,txt=''):
    print(txt+" %.2f %.2f %.2f - "%(v,v,v))
def show(v,txt=''):
    print(txt+" %.2f %.2f %.2f %.2f "%(v/3,v/3,v/3,v))
show1(vl,'"V\(L\)[W]"  =')
show1(il,'"V\(L\)[W]"  =')

show(p,'"P[W]"  =')
show(q,'"Q[Var]"= ')
show(s,'"S[W]"  =')
input('press anykey...')
