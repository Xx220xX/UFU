import math, re, matplotlib.pyplot as plt, numpy

def Polinomio(*roots, cte=1):
    if cte != 1:
        return [cte * i for i in numpy.polynomial.polynomial.polyfromroots(list(roots))]
    return numpy.polynomial.polynomial.polyfromroots(list(roots))


def db(h):
    return 20 * math.log10(abs(h))


def system2str(a: list, b: list):
    h = ['', '', '']
    i = len(a) - 1
    while i >= 0:
        h[0] += f'{a[i]} * (jw)^{i} + '
        i -= 1
    i = len(b) - 1
    while i >= 0:
        h[2] += f'{b[i]} * (jw)^{i} + '
        i -= 1
    h[0], h[2] = re.sub(r'^(1 \*)|(1\.0 \* )', '', re.sub(r'(\* \(jw\)\^0)|(\^1)', '', h[0][:-3])), \
                 re.sub(r'^(1 \*)|(1\.0 \* )', '', re.sub(r'(\* \(jw\)\^0)|(\^1)', '', h[2][:-3]))
    h[1] = '-' * max(len(h[0]), len(h[2]))
    if len(h[0]) < len(h[2]):
        h[0] = ' ' * ((len(h[2]) - len(h[0])) // 2) + h[0]
    else:
        h[2] = ' ' * ((len(h[0]) - len(h[2])) // 2) + h[2]
    return h[0] + '\n' + h[1] + '\n' + h[2]


def system(a: list, b: list):
    """
    :param a: Numerador do sistema
    :param b:
    :return:
    """
    def H(w):
        num, den = 0, 0
        for i in range(len(a)):
            num += a[i] * (1j * w) ** i
        for i in range(len(b)):
            den += b[i] * (1j * w) ** i
        return num / den
    return H

def bodeAssintotico(a: list, b: list, wlim: list = (0.1, 100), poits=300):
    """
    Retorna o gráfico de bode assintótico
    :param poits: Numero de pontos a serem criados
    :param wlim: Limite da lista w
    :param a: coeficientes do numeriado a0 + a1 (jw)^1 + ...
    :param b: coeficientes do denominador b0 + b1 (jw)^1 + ...
    :return: vetor w e y em que y é em escala dB ,
    :sugestao plotar eixo x em escala Log10
    """
    roota = [-r for r in numpy.roots(a[-1::-1])]
    rootb = [-r for r in numpy.roots(b[-1::-1])]
    w, y = [wlim[0]], [db(system(a, b)(wlim[0]))]
    if wlim[0] < 0 or wlim[1] < 0 or wlim[1] < wlim[0]:
        raise ValueError('limites estranhos')
    ts = (wlim[1] - wlim[0]) / poits
    for i in range(1, poits - 1):
        ganhoPdc = 0
        x = i * ts
        for r in roota:
            if x > r:
                ganhoPdc += 40
        for r in rootb:
            if x > r:
                ganhoPdc -= 40
        y.append(ganhoPdc * ts / (9 * x) + y[-1])
        w.append(x)
    return w, y
