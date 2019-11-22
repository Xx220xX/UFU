# plotar grafico do sinal
from math import sin, cos, pi
import matplotlib.pyplot as plt

pi2 = 2 * pi


def f(t):
    return 5 * sin(pi2 * 1e3 * t) + 2 * cos(pi2 * 3e3 * t) + 0.5 * sin(
        pi2 * 5e3 * t)


pontos = 1000
limite = [0, 0.01]
ts = (limite[1] - limite[0]) / pontos
t = [i * ts for i in range(pontos)]
x = [f(i) for i in t]
plt.plot(t, x)
plt.title('Sinal')
plt.ylabel('x(t)')
plt.xlabel('t')
plt.grid(True)
plt.savefig('out/Sinalx.png')
w = [-5, -3, -1, 1, 3, 5]
H = [pi / 2, pi2, 5 * pi, 5 * pi, pi2, pi / 2]
plt.clf()
plt.title('Espectro')
plt.ylabel('abs(H(jw))')
plt.xlabel('f [kHz]')
plt.stem(w[3:], H[3:], use_line_collection=True)
plt.grid(True)
plt.savefig('out/espectro')
