import numpy as np

from libs import *

a = s2c('1|120')
T = [[1] * 3, [1, a ** 2, a], [1, a, a ** 2]]
T = np.array(T)


T = Matrix([[1,2,3]],2,21)
print(T)
