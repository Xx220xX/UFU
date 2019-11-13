import Sites

profs = Sites.Docente.load_list('../out/Docentes/profs.bin')  # le a lista de Docentes
table = ''
with open('table.md', 'w', encoding='utf-8')as file:
    print('| Nome | Status |lates |email |faculdade |telefone |', file=file)
    print('| :----------: | :----------: |:----------: |:----------: |:----------: |:----------: |', file=file)

    for prof in profs:
        print(prof.tableMarkdown(), file=file)
