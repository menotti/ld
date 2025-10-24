#!/usr/bin/env python3
import os
import argparse

parser = argparse.ArgumentParser()
group = parser.add_mutually_exclusive_group()
group.add_argument("-g", "--grupo", action="store_true")
group.add_argument("-b", "--bancada", action="store_true")
args = parser.parse_args()

files = os.listdir()
files.sort()
prefix = "Grupo ##"
if args.bancada:
    prefix = "Bancada ###"
last = prefix
print("Using prefix", last)
for filename in files:
    if filename.startswith(prefix[:len(prefix)-3]):
        if last != filename[:len(prefix)]:
            last = filename[:len(prefix)]
            print("keep:", filename)
        else:
            os.unlink(filename)
            print("delete:", filename)
