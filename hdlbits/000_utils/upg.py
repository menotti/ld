#!/usr/bin/env python3
import os
files = os.listdir() 
files.sort()
# prefix = "Grupo ##"
prefix = "Bancada ###"
last = prefix
for filename in files:
    if last != filename[:len(prefix)]:
        last = filename[:len(prefix)]
        print("keep:", filename)
    else:
        os.unlink(filename)
        print("delete:", filename)


