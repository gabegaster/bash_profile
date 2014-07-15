#!/usr/local/bin/python
import sys
import numpy as np

def naive_variance(data):
    s = s2 = 0
    for N, line in enumerate(data,1):
        x = int(line)
        s += x
        s2+= x**2
        
    return (s2 - 1. * s**2 / N ) / N

def test():
    d = [600, 470, 170, 430, 300]
    import numpy as np
    assert np.abs(naive_variance(d) - np.var(d)) < .01

if __name__=="__main__":
    print naive_variance(sys.stdin)
    # test()
