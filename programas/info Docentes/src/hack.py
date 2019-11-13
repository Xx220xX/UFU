# objetivos abrir arquivos dos docentos
# captura qualquer arquivo que tenha notas

import pandas  # pip install pandas
import requests  # pip install requests
from bs4 import BeautifulSoup  # pip install bs4
from Sites import *


# pegar site da feelt
print('abrindo site felt')
site_Feelt = requests.get('http://www.feelt.ufu.br/pessoas/docentes')
if site_Feelt.status_code == 200:
    print('Sucesso ao abrir site')
else:
    raise FileExistsError('não foi possivel acessar o site')

print('extraindo dados')
profs = extrair_docentes(site_Feelt)
# printar aquivos

with open('output.txt', 'w', encoding='utf-8') as file:
    file.write(re.sub(r'[\[\]]|(,\x20)', '\n', str(profs)))
print('Salvando dados')
Docente.salve_list(profs,'../out/Docentes/profs.bin')
print('Programa finalizado')
