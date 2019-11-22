p1 = 'ipanema'
p2 = 'america'
s = p2
# =============================================================================#
# solução 1 usando replace
print('solução 1 usando replace')
for c in p1:
    s = s.replace(c, '');
if len(s) == 0:
    print('É anagrama')
else:
    print('não é  anagrama')

# =============================================================================#
# solução 2 usando in
print('solução 2 usando in')
try:
    for c in p1:
        if not c in p2:
            raise ZeroDivisionError()
    print('é anagrama!')
except ZeroDivisionError:
    print('não é  anagrama')
# =============================================================================#
# solução 3 usando sort
print('solução 2 usando sort')
if not sorted(set(p1)) == sorted(set(p2)):
    print('não ',end='')
print('é anagrama!')

#=============================================================================#
