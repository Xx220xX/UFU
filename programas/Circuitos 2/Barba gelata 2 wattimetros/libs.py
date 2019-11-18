from math import *
import cmath
import scipy as sp
import numpy as np


def s2c(c: str):
    if isinstance(c, (float, int)):
        return c
    c = c.split('|', 1)
    if len(c) == 0:
        c = [0, 0]
    elif len(c) == 1:
        c.append(0)
    c = [float(i) for i in c]
    c[1] = c[1] * pi / 180
    return complex(round(c[0] * cos(c[1]), 10), round(c[0] * sin(c[1]), 10))


def pc(c: complex, precisao=4):
    if isinstance(c, (int, float)):
        return f'%.{precisao}f' % c
    elif isinstance(c, str):
        return c
    return f'%.{precisao}g|%.{precisao}g°' % (abs(c), cmath.phase(c) * 180 / pi)


class Matrix:
    def __init__(self, data: list = None, size_i: int = None, size_j: int = None):
        if isinstance(data, (int, float)):
            size_j = size_i
            size_i = data
            data = None
        if data == size_j == size_i is None:
            raise AttributeError('Falta coisa ai man')
        if size_i is None:
            size_i = len(data)
        if size_j == None:
            size_j = len(data[0])
        if data is None:
            self.data = np.array([[0] * size_j] * size_i)
        if data:
            m = []
            for i in range(size_i):
                m.append([])
                for j in range(size_j):
                    if i < len(data) and j < len(data[i]):
                        m[i].append(data[i][j])
                    else:
                        m[i].append(0)
            self.data = np.array(m)

    def __repr__(self):
        return np.array2string(self.data)
