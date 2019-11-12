from cmath import *
from math import *
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches


def bode(title, func, x, color='r', color2="b", grid=True, x_label="", y_label="dB"):
    y = [20 * log10(abs(func(h))) for h in x]
    x = [log10(i) for i in x]
    plt.plot(x, y, color=color)
    plt.grid(grid)
    if title:
        plt.title(title)
    plt.ylabel(y_label)
    plt.xlabel(x_label)
    return y


def bodeAss(title, w: list, y: list, roots, color='r', grid=True, x_label="", y_label="dB"):
    y_n = [y[0]]
    x_n = [log10(w[0])]
    roots.sort()
    for i in range(len(w)):
        for rt in roots:
            if abs(w[i] - rt) < 0.03:
                if len(y_n) == 1:
                    y_n.append(y[0])
                else:
                    y_n.append(y[i])
                x_n.append(log10(w[i]))
    x_n.append(log10(w[-1]))
    y_n.append(y[-1])
    plt.plot(x_n, y_n, color=color)
    plt.grid(grid)
    if title:
        plt.title(title)


def legenda(lg: list):
    plt.legend(handles=[mpatches.Patch(color=i[0], label=i[1]) for i in lg])


def graph(title, H, w, color, index_H, roots, grid=True):
    plt.clf()
    y = bode(title, H, w, color=color[0])
    bodeAss(None, w, y, roots, color=color[1], grid=grid)
    legenda([('r', "Real"), ('g', "Assintatico")])
    plt.savefig(f"H{index_H}.png")

    plt.clf()
    plt.plot(w, [abs(H(i)) for i in w], color=color[2])
    plt.grid(grid)
    plt.title(f"MODULO de H{index_H}(jw)")
    plt.savefig(f"jwH{index_H}.png")
