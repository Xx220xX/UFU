from sci_math import bode
from math import ceil

ts, w_max = 0.5, 1000
w = [i * ts for i in range(1, ceil(w_max / ts))]
h1, h2, ht = lambda w: 640 * (1j * w + 1) / ((1j * w + 8) * (1j * w + 40)), \
             lambda w: 0.01 * (1j * w + 40) / ((1j * w + 1) * (1j * w + 8)), \
             lambda w: 6.4 / (1j * w + 8) ** 2
bode.graph("Diagrama de bode para H1", h1, w, ('r', 'g', 'b'),
      '1', [1, 8, 40], grid=True)
bode.graph("Diagrama de bode para H2", h2, w, ('r', 'g', 'b'),
      '2', [8, 1, 40], grid=True)
bode.graph("Diagrama de bode para Htotal", ht, w, ('r', 'g', 'b'), 'total', [8], grid=True)
