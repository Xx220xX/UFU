from Sites import *
# import PyPDF2  # pip install PyPDF2
from tabula import read_pdf  # pip install tabula-py
import pdfquery  # pip install pdfquery


def square(x_botom, y_botom, x_top, y_top, mm=True):
    y_top = 211 - y_top
    y_botom = 211 - y_botom
    if mm:
        x_botom /= 25.4
        y_botom /= 25.4
        x_top /= 25.4
        y_top /= 25.4
    x_botom *= 72
    y_botom *= 72
    x_top *= 72
    y_top *= 72
    #print('%s, %s, %s, %s' % (x_botom, y_botom, x_top, y_top))
    return '%s, %s, %s, %s' % (x_botom, y_botom, x_top, y_top)


profs = Docente.load_list('Docentes/profs.bin')  # le a lista de Docentes
prof = profs[0]

# usar o modulo
# tabula
# pdf = read_pdf('Docentes/' + prof.name + '/2018 - 2.pdf')

# pdfquery
for prof in profs:
    try:
        pdf = pdfquery.PDFQuery('Docentes/' + prof.name + '/2018 - 2.pdf')
    except FileNotFoundError:
        print(f'{prof.name} não possui informaçao')
        continue
    pdf.load(0)
# txt = pdf.extract([('ola','LTTextLineHorizontal:in_bbox("128,86,109,81")')])
    print(pdf._pages)
    a = pdf.extract([('with_formatter', 'text'),\
                 ('total de aulas', f':in_bbox("{square(100, 131, 137, 81)}")')])
                # ('2', f'LTTextLineHorizontal:in_bbox("{square(10, 91, 90, 55)}")'),\
                # ('3', f'LTTextLineHorizontal:in_bbox("{square(10, 131, 283, 81)}")')])
    print(prof.name)
    for k,v in a.items():
        print(k,":",v)
    break

#print(capturarDado('>[\w\s]+<',str(a['1']),1,-1))

