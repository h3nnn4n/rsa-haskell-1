#HSFLAGS=-prof -fforce-recomp -auto-all -caf-all --make -O2
HSFLAGS=-w

all:
	ghc keyBreaker	$(HSFLAGS) 
	ghc keyGen	$(HSFLAGS) 
	ghc encrypter	$(HSFLAGS) 
	ghc decrypter	$(HSFLAGS) 
	ghc properKeyGenerator $(HSFLAGS) 


breaker:
	ghc keyBreaker	$(HSFLAGS) 


generator:
	ghc keyGen	$(HSFLAGS) 


encrypter:
	ghc encrypter	$(HSFLAGS) 


decrypter:
	ghc decrypter	$(HSFLAGS) 


proper:
	ghc properKeyGenerator $(HSFLAGS) 


clean:
	-rm -v *.{o,hi}
