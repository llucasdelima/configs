import os
import shutil

# variaveis e paths
img_path = "./images"
division = 0
from datetime import date
today = date.today()
day = today.strftime("%d/%m/%Y")

subtitulo = input("Digite o subtitulo: ")

# "database" de erros
a = "Lorem A"
b = "Lorem B"
c = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
d = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
e = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
f = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
g = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
h = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
i = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
j = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
k = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
l = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
m = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
n = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
o = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
p = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
q = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
r = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
s = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
t = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
u = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
v = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
w = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
x = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
y = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."
z = "Pariatur sit quibusdam in dolores illum et. Enim consectetur soluta voluptatem molestiae pariatur sed recusandae enim. Ratione qui aliquam perferendis quam quisquam consequatur. Deserunt officiis deserunt dolorem odio sed nihil. Explicabo quod reprehenderit fuga."

# pega todas os arquivos de imagens de uma pasta
# e coloca em uma array para acessar mais tarde
file = []
for files in os.listdir(img_path) :
  if files.lower().endswith(('.jpg', '.png', '.jpeg', '.jfif')) :
    file += [files]

# cria e escreve um arquivo de latex
with open('relatorio.tex', 'w', encoding='utf-8') as wf :

  latexBeggin = """
\\documentclass[a4paper,12pt,oneside]{article}

\\usepackage{graphicx}
\\usepackage[a4paper, inner=2cm, outer=2cm, top=2cm, bottom=3cm, bindingoffset=0cm]{geometry}
\\usepackage{fancyhdr}

\\renewcommand{\\thefigure}{\\arabic{figure}}
\\renewcommand{\\familydefault}{\\sfdefault}
\\renewcommand{\\figurename}{Fig.}

\\pagestyle{fancy}
\\fancyhf{}
\\lhead{RB2 Engenharia e Construção}
\\rhead{Relatório de Pendências}
\\rfoot{\\thepage}

\\begin{document}

\\begin{titlepage}
\\centering
\\begin{figure}
\\begin{center}
\\includegraphics[width=0.30\\linewidth]{logo.jpg}
\\end{center}
\\end{figure}
\\
\\vfill
\\textbf{\\Huge RELATÓRIO DE PENDÊNCIAS}\\\\[\\baselineskip]
\\textbf{""" + subtitulo + """}\\\\[\\baselineskip]
\\vfill
{\\Large{Augusto Vidiri}}\\\\
\\vfill
{\\Large{"""+ day +"""}}\\\\
{\\Large{Limeira - SP}}
\\end{titlepage}

\\centering
"""
  latexEnd = """\\end{document}"""

  wf.write(latexBeggin+'\n')

  for line in file :
    wf.write('\\begin{figure}\n')
    wf.write('\\begin{center}\n')
    wf.write('\\includegraphics[width=0.40\\linewidth]{./images/' + line + '}\n')

    if line[:1] == "a" :
      wf.write('\\caption{'+ a +'}\n')
    if line[:1] == "b" :
      wf.write('\\caption{'+ b +'}\n')
    if line[:1] == "c" :
      wf.write('\\caption{'+ c +'}\n')
    if line[:1] == "d" :
      wf.write('\\caption{'+ d +'}\n')
    if line[:1] == "e" :
      wf.write('\\caption{'+ e +'}\n')
    if line[:1] == "f" :
      wf.write('\\caption{'+ f +'}\n')
    if line[:1] == "g" :
      wf.write('\\caption{'+ g +'}\n')
    if line[:1] == "h" :
      wf.write('\\caption{'+ h +'}\n')
    if line[:1] == "i" :
      wf.write('\\caption{'+ i +'}\n')
    if line[:1] == "j" :
      wf.write('\\caption{'+ j +'}\n')
    if line[:1] == "k" :
      wf.write('\\caption{'+ k +'}\n')
    if line[:1] == "l" :
      wf.write('\\caption{'+ l +'}\n')
    if line[:1] == "m" :
      wf.write('\\caption{'+ m +'}\n')
    if line[:1] == "n" :
      wf.write('\\caption{'+ n +'}\n')
    if line[:1] == "o" :
      wf.write('\\caption{'+ o +'}\n')
    if line[:1] == "p" :
      wf.write('\\caption{'+ p +'}\n')
    if line[:1] == "q" :
      wf.write('\\caption{'+ q +'}\n')
    if line[:1] == "r" :
      wf.write('\\caption{'+ r +'}\n')
    if line[:1] == "s" :
      wf.write('\\caption{'+ s +'}\n')
    if line[:1] == "t" :
      wf.write('\\caption{'+ t +'}\n')
    if line[:1] == "u" :
      wf.write('\\caption{'+ u +'}\n')
    if line[:1] == "v" :
      wf.write('\\caption{'+ v +'}\n')
    if line[:1] == "w" :
      wf.write('\\caption{'+ w +'}\n')
    if line[:1] == "x" :
      wf.write('\\caption{'+ x +'}\n')
    if line[:1] == "y" :
      wf.write('\\caption{'+ y +'}\n')
    if line[:1] == "z" :
      wf.write('\\caption{'+ z +'}\n')

    wf.write('\\end{center}\n')
    wf.write('\\end{figure}\n')

    if division == 0 :
      division =division + 1
    else :
      wf.write('\\clearpage\r\r')
      division = 0

  wf.write(latexEnd)