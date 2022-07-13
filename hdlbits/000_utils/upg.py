#!/usr/bin/env python3
import os
files = os.listdir() 
files.sort()
prefix = "Group "
for filename in files:
    if prefix != filename[:8]:
        prefix = filename[:8]
        print("keep:", filename)
    else:
        os.unlink(filename)
        print("delete:", filename)


