#!/usr/local/bin/python
import sys

s = 0
for count,line in enumerate(sys.stdin):
    s+=int(line)

print 1. * s / (count+1)
