import matplotlib.pyplot as plt
from math import *
"""
 insere x e y
"""
def f(a,b):
    if abs(a)>abs(b):
        return b/a
    return a/b
#x = [10.000000 , 10.000389 , 10.001753 , 10.002240 , 10.002795 , 10.003069 , 10.003340 , 10.003593 , 10.004098 , 10.004653 , 10.004922 , 10.005756 , 10.006867 , 10.007978 , 10.009089 , 10.010040 , 10.010734 , 10.011012 , 10.011230 , 10.011449 , 10.011640 , 10.011868 , 10.012322 , 10.012878 , 10.013208 , 10.014041 , 10.015152 , 10.016263 , 10.016670 , 10.017212 , 10.018313 , 10.019077 , 10.019355 , 10.019570 , 10.019773 , 10.019972 , 10.020201 , 10.020661 , 10.021217 , 10.021703 , 10.022814 , 10.023925 , 10.025036 , 10.026147 , 10.027258 , 10.027814 , 10.028145 , 10.028414 , 10.028693 , 10.029248 , 10.029318 , 10.029457 , 10.029804 , 10.030221 , 10.031332 , 10.032443 , 10.033334 , 10.033605 , 10.034425 , 10.035536 , 10.036091 , 10.036396 , 10.036678 , 10.036938 , 10.037456 , 10.037525 , 10.037664 , 10.037942 , 10.038393 , 10.039227 , 10.040338 , 10.041449 , 10.042560 , 10.043307 , 10.043932 , 10.044209 , 10.044434 , 10.044592 , 10.044749 , 10.044902 , 10.045209 , 10.045764 , 10.046320 , 10.046589 , 10.047422 , 10.048533 , 10.049644 , 10.050003 , 10.050545 , 10.051647 , 10.052758 , 10.053077 , 10.053381 , 10.053676 , 10.054232 , 10.054301 , 10.054440 , 10.054718 , 10.055048 , 10.055881 , 10.056992 , 10.058103 , 10.059214 , 10.059978 , 10.060812 , 10.061137 , 10.061391 , 10.061593 , 10.061807 , 10.062234 , 10.062790 , 10.063241 , 10.064074 , 10.065186 , 10.066297 , 10.066670 , 10.067212 , 10.068313 , 10.069425 , 10.069470 ]
#y = [71.640800 , 71.034800 , 68.944900 , 68.213600 , 67.785100 , 71.342300 , 74.274400 , 76.277100 , 78.174000 , 78.266100 , 77.806300 , 76.401500 , 74.571600 , 72.787200 , 71.043400 , 69.582100 , 68.531700 , 68.115400 , 69.143900 , 71.906300 , 73.960100 , 75.877100 , 78.003100 , 78.309700 , 77.746500 , 76.343900 , 74.517500 , 72.736600 , 72.095100 , 71.247800 , 69.552300 , 68.397900 , 67.982300 , 69.224300 , 71.799900 , 73.942400 , 75.880600 , 78.014100 , 78.310700 , 77.482300 , 75.625700 , 73.818700 , 72.054100 , 70.326800 , 68.636200 , 68.084300 , 72.238000 , 74.929400 , 76.878000 , 78.211100 , 78.140900 , 77.945500 , 77.388800 , 76.687000 , 74.849900 , 73.059800 , 71.652900 , 71.230200 , 69.965700 , 68.282400 , 67.458800 , 71.276200 , 74.317400 , 76.351900 , 78.195600 , 78.213500 , 78.130500 , 77.780100 , 77.015400 , 75.625300 , 73.813600 , 72.045600 , 70.317200 , 69.177300 , 68.235800 , 67.820900 , 67.501400 , 69.493300 , 71.523700 , 73.246900 , 75.931200 , 78.173200 , 78.285200 , 77.825200 , 76.419900 , 74.589400 , 72.804500 , 72.236900 , 71.387700 , 69.688900 , 68.012200 , 71.452500 , 74.635900 , 76.784400 , 78.217500 , 78.157900 , 77.972900 , 77.542100 , 76.984900 , 75.596400 , 73.787100 , 72.020900 , 70.293800 , 69.128400 , 67.876500 , 67.888500 , 71.201200 , 73.489000 , 75.418000 , 77.768800 , 78.262600 , 77.492900 , 76.093800 , 74.270800 , 72.492500 , 71.904500 , 71.058600 , 69.366700 , 67.696700 , 67.834700 ]
t = pi
ts = 0.001
r3 = sqrt(3)
theta = [ ts*i-pi/2 for i in range(ceil(t/ts))]
w1_w2 = [f(cos(i-pi/6),cos(i+pi/6)) for i in theta]
cos_theta = [cos(i) for i in theta]

x = [0.27 for i in theta]

#plt.plot(w1_w2,x,color = 'black', linewidth=0.4)
plt.plot(x,cos_theta,color = 'black' ,linewidth= 0.4)
plt.plot(w1_w2,cos_theta,color = 'g' )

plt.plot([0],[0.5],color = 'r',marker = 'o' )
plt.plot([0.27],[0.71],color = 'b',marker = 'x')
plt.text(-0.2, 0.5, 'fp = 0.5\nθ = 60°', horizontalalignment='center',verticalalignment='center')

plt.ylabel('fator de potencia: cos(θ)',color = 'b');
plt.xlabel('w1/w2 se w1>w2 ou w2/w1 se w2>w1',color = 'b');
plt.grid(True,alpha = 0.5);
plt.title('Relação entre w1 e w2');
#plt.ylim((-1,1))
#plt.xlim((-1,1))
plt.show();