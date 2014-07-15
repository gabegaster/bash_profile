#!/usr/local/bin/python
import sys

old = 0
for line in sys.stdin:
    h,m,s = map(int,line.split(":"))
    new = m*60 + s
    print new-old
    old = new
