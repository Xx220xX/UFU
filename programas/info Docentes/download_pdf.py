from Sites import *
import requests, os
profs = Docente.load_list('Docentes/profs.bin')  # le a lista de Docentes
# Baixar pdfs
for prof in profs:
    print('Baixando pdf de ', prof.name)
    for v, i in prof.link_pdf_plano_de_ensino.items():
        print('\t',f'{v}.pdf',end='  ')
        pdf = requests.get(i)
        if not os.path.exists('Docentes/' + prof.name):
            os.makedirs('Docentes/' + prof.name)
        with open('Docentes/' + prof.name + f'/{v}.pdf', 'wb') as pdf_file:
            pdf_file.write(pdf.content)
        print('sucesso!')



