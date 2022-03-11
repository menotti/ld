#!/usr/bin/env python3

import urllib.request
import lxml.html
import math

with open('links.txt') as f:
    lines = f.readlines()
for link in lines:
    content = urllib.request.urlopen(link).read()
    doc = lxml.html.fromstring(content)
    for el in doc.find_class('title'):
        print(link, el.text_content())
    if not 'solved' in locals():
        solved = []
        for el in doc.find_class('vlgstat_link'):
            solved.append(el.text_content())
        print(' ', len(solved), 'problemas resolvidos pelo professor!') 
    else:
        total = 0
        new = 0
        for el in doc.find_class('vlgstat_link'):
            if not el.text_content() in solved:
                new += 1
            total += 1
        print('  resolveu', total, 'problemas, sendo', new, 'novos:', math.trunc(new/(total+0.0000000000001)*100), '%') 
