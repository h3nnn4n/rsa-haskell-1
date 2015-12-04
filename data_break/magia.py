#!/usr/bin/python3

for i in range(10,45):
    name = "time_" + str(i)
    x = open(name)
    xl = x.readlines()
    xll = [ w.splitlines() for w in xl]
    #print(xl, xll)
    ss = 0.0
    for j in xll:
        w = j[0].split(' ')
        ss += float(w[0])

    ss = ss / len(xll)

    print(i, ss)
