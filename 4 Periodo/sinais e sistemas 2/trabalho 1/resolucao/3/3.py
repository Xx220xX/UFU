# plotar grafico do sinal
import math,matplotlib.pyplot as plt


def sinal(t):
    return 5 * math.sin(2 * math.pi * 1e3 * t) + 2 * math.cos(2 * math.pi * 3e3 * t) + 0.5 * math.sin(
        2 * math.pi * 5e3 * t)


pontos = 1000
limite = [0, 0.01]
ts = (limite[1] - limite[0]) / pontos
t = [i * ts for i in range(pontos)]
x = [sinal(i) for i in t]
plt.plot(t,x)
plt.title('Sinal')
plt.ylabel('x(t)')
plt.xlabel('t')
plt.grid(True)
plt.savefig('out/Sinalx')
