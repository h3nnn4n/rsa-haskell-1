#HSFLAGS=-prof -fforce-recomp -auto-all -caf-all --make -O2
HSFLAGS=-w
.PHONY:clean
all: breaker generator encrypter decrypter proper

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
	-@rm -v *.o *.hi 2> /dev/null || true
