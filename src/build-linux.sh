#!/bin/bash

# Linux build
make distclean || echo clean

rm -f config.status
./autogen.sh || echo done

# Ubuntu 10.04 (gcc 4.4)
# extracflags="-O1 -march=native -Wall -D_REENTRANT -funroll-loops -fvariable-expansion-in-unroller -fmerge-all-constants -fbranch-target-load-optimize2 -fsched2-use-superblocks -falign-loops=16 -falign-functions=16 -falign-jumps=16 -falign-labels=16"

# Debian 7.7 / Ubuntu 14.04 (gcc 4.7+)
#extracflags="$extracflags -Ofast -flto -fuse-linker-plugin -ftree-loop-if-convert-stores"

#-Wall
#-std=gnu++11
#-march=$1 -mtune=$1

build(){
	echo " "
	clear
  FLAGS="-O1 -march=$1 -mtune=$1"
	CFLAGS="$FLAGS" CXXFLAGS="$CFLAGS -std=c++11" ./configure --with-curl
	make -j 4

  echo ""
	echo "This build used:"
	echo "CFLAGS: $FLAGS"
}

####################################################
## TRYING TO COMPILE WITH THE MOST OPTIMIZED ARCH ##
####################################################

build native

####################################################

strip -s cpuminer
