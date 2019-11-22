from matplotlib import pyplot as plt

from sci_math import Sinais


def GerarGraficos(a: list, b: list, file):
    H = Sinais.system(a, b)
    y, name, ylabel, xscale = [None, None, None], ['Assintótico', 'Calculado', 'Linear'], ['dB', 'dB', 'Amplitude'], \
                              ['log', 'log', 'linear']
    w, y[0] = Sinais.bodeAssintotico(a, b, wlim=[0.1, 377], poits=10000)
    y[1], y[2] = [Sinais.db(H(i)) for i in w], [abs(H(h)) for h in w]
    print('sistema:\n', Sinais.system2str(a, b), '\n')
    for i in range(len(y)):
        a = plt.gca()
        a.plot(w, y[i])
        a.set_title(name[i])
        plt.xlabel('w')
        a.set_ylabel(ylabel[i])
        a.set_xscale(xscale[i])
        plt.grid(True, which="both")
        plt.savefig((file + (name[i]).replace('ó', 'o')).replace(' ', '_') + '.png')
        plt.clf()


GerarGraficos(Sinais.Polinomio(-1, cte=640), Sinais.Polinomio(-8, -40), 'out/Grafico_de_bode_H1_')
GerarGraficos(Sinais.Polinomio(-40, cte=0.01), Sinais.Polinomio(-1, -8), 'out/Grafico_de_bode_H2_')
GerarGraficos([6.4], Sinais.Polinomio(-8, -8), 'out/Grafico_de_bode_Ht_')
