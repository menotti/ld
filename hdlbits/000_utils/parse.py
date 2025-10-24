#!/usr/bin/env python3

import urllib.request
import lxml.html
import math
import ssl 

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

with open('links.txt') as f:
    lines = f.readlines()

hof = []

for link in lines:
    content = urllib.request.urlopen(link, context=ctx).read()
    doc = lxml.html.fromstring(content)
    for el in doc.find_class('title'):
        try:
            name = el.text_content().split()[2]
        except:
            print('\n Erro:', el.text_content(), link)
    if not 'solved' in locals():
        solved = []
        for el in doc.find_class('vlgstat_link'):
            solved.append(el.text_content())
        print(' ', len(solved), 'problemas resolvidos pelo professor!') 
    else:
        print('.', end='', flush=True)
        total = 0
        new = 0
        for el in doc.find_class('vlgstat_link'):
            if not el.text_content() in solved:
                new += 1
            total += 1
        hof.append((total, new, name))
print('\nHall of fame!')
hof.sort(reverse=True)
for el in hof:
    print((el[2] + '\t').expandtabs(70), el[0], '/', el[1], ': ', math.trunc(el[1]/(el[0]+0.0000000000001)*100), '%') 
