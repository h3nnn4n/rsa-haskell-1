#HSFLAGS=-prof -fforce-recomp -auto-all -caf-all --make -O2
HSFLAGS=-w

all:
	ghc keyBreaker	$(HSFLAGS) 
	ghc keyGen	$(HSFLAGS) 
	ghc encrypter	$(HSFLAGS) 


breaker:
	ghc keyBreaker	$(HSFLAGS) 


generator:
	ghc keyGen	$(HSFLAGS) 


encrypter:
	ghc encrypter	$(HSFLAGS) 

clean:
	-rm -v *.{o,hi}
