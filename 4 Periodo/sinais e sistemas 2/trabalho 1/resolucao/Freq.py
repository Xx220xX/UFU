from math import pi

Fs = float(input('digite a taxa de amostragem: '))
op = input('opcao deseadao: \n   [1] RAD to Freq\n   [2] Freq to RAD \n:')
if op == '1':
    w = float(input('Digite a frequencia rad/s: '))
    f =  w*Fs/(2*pi)
    print('f = %.4f' % f)

elif op == '2':
    f = float(input('Digite a frequencia desejada: '))
    w = f * 2 * pi / Fs
    print('W = %.4f'%w)
