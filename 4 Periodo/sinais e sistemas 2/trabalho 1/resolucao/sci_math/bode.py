import math
import cmath
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy



def bode(title, func, x, color='r', color2="b", grid=True, x_label="", y_label="dB"):
    y = [20 * math.log10(abs(func(h))) for h in x]
    x = [math.log10(i) for i in x]
    plt.plot(x, y, color=color)
    plt.grid(grid)
    if title:
        plt.title(title)
    plt.ylabel(y_label)
    plt.xlabel(x_label)
    return y


def bodeAss(title, w: list, y: list, roots, color='r', grid=True, x_label="", y_label="dB"):
    y_n = [y[0]]
    x_n = [math.log10(w[0])]
    roots.sort()
    for i in range(len(w)):
        for rt in roots:
            if abs(w[i] - rt) < 0.03:
                if len(y_n) == 1:
                    y_n.append(y[0])
                else:
                    y_n.append(y[i])
                x_n.append(w[i])
    x_n.append(math.log10(w[-1]))
    y_n.append(y[-1])
    plt.plot(x_n, y_n, color=color)
    plt.grid(grid)
    if title:
        plt.title(title)


def decadaProxima(x):
    return 10 ** math.ceil(math.log10(x + 1))


def db(h):
    return 20 * math.log10(abs(h))


def bodeAssintotico(a: list, b: list, wlim: list = [0.1, 1000]):
    """
    Retorna o gráfico de bode assintótico
    :param a: coeficientes do numeriado a0 + a1 (jw)^1 + ...
    :param b: coeficientes do denominador b0 + b1 (jw)^1 + ...
    :return: vetor w e y em que y é em escala dB ,
    :sugestao plotar eixo x em escala Log10
    """
    roota = numpy.roots(a)
    rootb = numpy.roots(b)

    def H(w):
        num, den = 0, 0
        for i in range(len(a)):
            num += a[i] * (1j * w) ** i
        for i in range(len(b)):
            den += b[i] * (1j * w) ** i
        return num / den

    w, y = [db(H(wlim[0]))], [wlim[0]]
    x = wlim[0]
    if wlim[0] < 0.1 or wlim[1] < 0 or wlim[1] < wlim[0]:
        raise ValueError('limites estranhos')
    next_x = 0
    try:
        next_x = roota[0]
    except IndexError:
        try:
            next_x = rootb[0]
        except IndexError:
            w.append(wlim[1])
            y.append(y[-1])
            wlim[1] = -1
    df = True
    while x < wlim[1] and df:
        ganhoPdc = 0
        for r in roota:
            if x > r:
                ganhoPdc += 20
            if r > x and r < next_x:
                next_x = r
        for r in rootb:
            if x > r:
                ganhoPdc -= 20
            if r > x and r <= next_x:
                next_x = r

        y.append(ganhoPdc * (next_x - x) / (9 * x) + y[-1])
        w.append(next_x)
        df = x != next_x
        print(x, next_x)
        x = next_x

    h = ['', '','']
    size = len(a)-1
    for i in range(len(a)):
        h[0] += f'{a[size-i]} * (jw)^{size-i} + '
    size = len(b) - 1
    for i in range(len(b)):
        h[2] += f'{b[size - i]} * (jw)^{size - i} + '

    h[0],h[2] = h[0][0:-3].replace(' * (jw)^0','').replace('^1','').replace('1 *',),h[2][0:-3].replace(' * (jw)^0','').replace('^1','')
    h[1] = '-' * max(len(h[0]), len(h[2]))
    return (w, y, h)


def legenda(lg: list):
    plt.legend(handles=[mpatches.Patch(color=i[0], label=i[1]) for i in lg])


def graph(title, H, w, color, index_H, roots, grid=True):
    plt.clf()
    y = bode(title, H, w, color=color[0])
    bodeAss(None, w, y, roots, color=color[1], grid=grid)
    legenda([('r', "Real"), ('g', "Assintatico")])
    plt.savefig(f"out/H{index_H}.png")

    plt.clf()
    plt.plot(w, [abs(H(i)) for i in w], color=color[2])
    plt.grid(grid)
    plt.title(f"MODULO de H{index_H}(jw)")
    plt.savefig(f"out/jwH{index_H}.png")
