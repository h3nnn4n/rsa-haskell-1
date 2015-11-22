#HSFLAGS=-prof -fforce-recomp -auto-all -caf-all --make -O2
HSFLAGS=-w

all:
	ghc keyBreaker	$(HSFLAGS) 
	ghc keyGen	$(HSFLAGS) 


breaker:
	ghc keyBreaker	$(HSFLAGS) 


generator:
	ghc keyGen	$(HSFLAGS) 

clean:
	-rm -v *.{o,hi}
