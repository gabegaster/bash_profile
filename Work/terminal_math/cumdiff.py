#!/usr/local/bin/python
import sys

prior = cur = 0
for line in sys.stdin:
    cur = int(line)
    print cur-prior
    prior = cur

