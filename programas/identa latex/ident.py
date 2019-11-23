def identar(file_name, filename_out):
    tab = '\t'
    n = 0
    out = open(filename_out, 'w', encoding='utf-8')
    for line in open(file_name, 'r', encoding='utf-8'):
        line = line.strip()
        if r'\begin' in line:
            print(tab * n + line, file=out)
            n += 1
        if r'\end' in line:
            n -= 1
            print(tab * n + line, file=out)
        if n < 0:
            n = 0
        if not r'\end' in line and not r'\begin' in line:
            print(tab * n + line, file=out)
    out.close()


identar('inp.tex', 'out.tex')
