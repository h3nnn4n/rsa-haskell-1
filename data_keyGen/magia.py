#!/usr/bin/python3

#for i in range(1,43):
#    name = "time_" + str(i*128)
#    x = open(name)
#    xl = x.readlines()
#    xll = [ w.splitlines() for w in xl]
#    #print(xl, xll)
#    ss = 0.0
#    for j in xll:
#        w = j[0].split(' ')
#        ss += float(w[0])
#
#    ss = ss / len(xll)
#
#    print(i*128, ss)

for i in range(1,17):
    name = "time_" + str(i*512)
    x = open(name)
    xl = x.readlines()
    xll = [ w.splitlines() for w in xl]
    #print(xl, xll)
    ss = 0.0
    for j in xll:
        w = j[0].split(' ')
        ss += float(w[0])

    ss = ss / len(xll)

    print(i*512, ss)
