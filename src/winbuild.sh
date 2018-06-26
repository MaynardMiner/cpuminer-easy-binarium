#!/bin/bash

#if [ "$OS" = "Windows_NT" ]; then
#    ./mingw64.sh
#    exit 0
#fi

# Linux build

make distclean || echo clean

rm -f config.status
./autogen.sh || echo done

# Ubuntu 10.04 (gcc 4.4)
# extracflags="-O3 -march=native -Wall -D_REENTRANT -funroll-loops -fvariable-expansion-in-unroller -fmerge-all-constants -fbranch-target-load-optimize2 -fsched2-use-superblocks -falign-loops=16 -falign-functions=16 -falign-jumps=16 -falign-labels=16"

# Debian 7.7 / Ubuntu 14.04 (gcc 4.7+)
#extracflags="$extracflags -Ofast -flto -fuse-linker-plugin -ftree-loop-if-convert-stores"

#-O3  -march=native
#-std=gnu++11 -g
# --with-openldap=/media/rodion/SSD_Linux/CryptoCurrencies/Utilities/openldap-HEAD-465b1c5
CFLAGS="-O1 -Wall -march=native -static -DCURL_STATICLIB" CXXFLAGS="$CFLAGS -std=gnu++11 -fpermissive" LDFLAGS="-lws2_32" CCLD="x86_64-w64-mingw32-ld" CXXLD="x86_64-w64-mingw32-ld" ./configure --with-curl=/media/rodion/SSD_Linux/CryptoCurrencies/Utilities/curl-7.60.0 --with-crypto=/media/rodion/SSD_Linux/CryptoCurrencies/Utilities/openssl-1.0.2o --with-gmp=/media/rodion/SSD_Linux/CryptoCurrencies/Utilities/gmp-6.1.2 --host=x86_64-w64-mingw32 --enable-static

make -j 4

#strip -s cpuminer
#strip -p --strip-debug --strip-unneeded cpuminer.exe

#./Configure --cross-compile-prefix=x86_64-w64-mingw32- mingw64
#--disable-ldap --disable-ldaps
#./configure --host=x86_64-w64-mingw32 --disable-ldap --disable-ldaps --enable-static CFLAGS="-static -DCURL_STATICLIB" --disable-shared
#CXXLD = x86_64-w64-mingw32-ld

#cpuminer_LINK = $(CXXLD) $(AM_CXXFLAGS) $(cpuminer_LDFLAGS) $(LDFLAGS)