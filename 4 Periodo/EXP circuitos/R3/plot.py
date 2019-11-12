import matplotlib.pyplot as plt
x = [1.723000,1.417000,2.240000,3.590000,4.041000,5.390000]
y1 = [0.146000,0.308000,0.761000,0.750000,0.841000,1.131000]
y2 = [0.297390,0.232586,0.406878,0.692775,0.788286,1.073971]
plt.plot(x,y1,'ro',color='b')
plt.plot(x,y2,'ro',color='r')
plt.plot(x,y1,color='b')
plt.plot(x,y2,color='r')
plt.ylabel('tensão[v]')
plt.xlabel('corrente[I]')
plt.grid(True)
plt.title('Curto circuito')
plt.show()
