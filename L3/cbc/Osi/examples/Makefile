# Copyright (C) 2006 International Business Machines and others.
# All Rights Reserved.
# This file is distributed under the Eclipse Public License.

# $Id: Makefile.in 1881 2013-01-28 00:05:47Z stefan $

##########################################################################
#    You can modify this example makefile to fit for your own program.   #
#    Usually, you only need to change CHANGEME entries below.            #
##########################################################################

# CHANGEME
# To compile other examples, either change the following line, or add the
# argument DRIVER=filename_without_extension to make, e.g.,
# `make DRIVER=parameters'

DRIVER = basic

# CHANGME
# This should be the name of your executable; change if you want a name
# that's different from the file name.

EXE = $(DRIVER)

# CHANGEME
# OBJS should include all object files necessary to build your program. For
# the examples, only one file is needed for each example. You will probably
# have more as your code grows.

OBJS =  $(DRIVER).o

# CHANGEME
# Additional libraries. The examples require only the COIN libraries specified
# as LIBS below. You may need more.

ADDLIBS =

# CHANGEME
# Additional flags for compilation (e.g., include flags). As for libraries,
# the examples require only COIN include files, specified as part of CXXFLAGS
# below.

ADDINCFLAGS =

# CHANGEME
# Directory to the sources for the (example) problem definition files. VPATH
# is used if you are building in a different directory than the source. This
# can be handy for various reasons; if none occur to you, don't worry about
# it.

SRCDIR = .


##########################################################################
#  Usually, you don't have to change anything below.  Note that if you   #
#  change certain compiler options, you might have to recompile the      #
#  package.                                                              #
##########################################################################

COIN_HAS_PKGCONFIG = #TRUE
COIN_CXX_IS_CL = #TRUE
COIN_HAS_SAMPLE = TRUE
COIN_HAS_NETLIB = #TRUE

# C++ Compiler command
CXX = g++

# C++ Compiler options
CXXFLAGS = -g -O0 -pipe -Wparentheses -Wreturn-type -Wcast-qual -Wall -Wpointer-arith -Wwrite-strings -Wconversion -Wno-unknown-pragmas -Wno-long-long   -DOSI_BUILD  -I/mpsis/L3/cbc/ThirdParty/Glpk -I/mpsis/L3/cbc/ThirdParty/Glpk/glpk/src -I/mpsis/L3/cbc/ThirdParty/Glpk/glpk/src/amd  \
  -DOSIXXXhpp=\"OsiGlpkSolverInterface.hpp\" -DOSIXXX=OsiGlpkSolverInterface

# Sample data directory
ifeq ($(COIN_HAS_SAMPLE), TRUE)
  ifeq ($(COIN_HAS_PKGCONFIG), TRUE)
    CXXFLAGS += -DSAMPLEDIR=\"`PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:  --variable=datadir coindatasample`\"
  else
    CXXFLAGS += -DSAMPLEDIR=\"/usr/local/share/coin/Data/Sample\"
  endif
endif

# Netlib data directory
ifeq ($(COIN_HAS_NETLIB), TRUE)
  ifeq ($(COIN_HAS_PKGCONFIG), TRUE)
    CXXFLAGS += -DNETLIBDIR=\"`PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:  --variable=datadir coindatanetlib`\"
  else
    CXXFLAGS += -DNETLIBDIR=\"\"
  endif
endif

# additional C++ Compiler options for linking
CXXLINKFLAGS = 

# Include directories (we use the CYGPATH_W variables to allow compilation with Windows compilers)
ifeq ($(COIN_HAS_PKGCONFIG), TRUE)
  INCL = `PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:  --cflags osi-glpk osi`
else
  INCL =  -I/usr/local/include/coin  -I/usr/local/include/coin/ThirdParty  
endif
INCL += $(ADDINCFLAGS)

# Linker flags
ifeq ($(COIN_HAS_PKGCONFIG), TRUE)
  LIBS = `PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:  --libs osi-glpk osi`
else
  ifeq ($(COIN_CXX_IS_CL), TRUE)
    LIBS = -link -libpath:`$(CYGPATH_W) /usr/local/lib` libOsi.lib -lOsiGlpk  -L/usr/local/lib -lcoinglpk -ldl -lm    -L/usr/local/lib -lCoinUtils -lm   -L/usr/local/lib -lcoinglpk -ldl -lm   
  else
    LIBS = -L/usr/local/lib -lOsi -lOsiGlpk  -L/usr/local/lib -lcoinglpk -ldl -lm    -L/usr/local/lib -lCoinUtils -lm   -L/usr/local/lib -lcoinglpk -ldl -lm   
  endif
endif

# The following is necessary under cygwin, if native compilers are used
CYGPATH_W = echo

all: $(EXE)

.SUFFIXES: .cpp .c .o .obj

$(EXE): $(OBJS)
	bla=;\
	for file in $(OBJS); do bla="$$bla `$(CYGPATH_W) $$file`"; done; \
	$(CXX) $(CXXLINKFLAGS) $(CXXFLAGS) -o $@ $$bla $(LIBS) $(ADDLIBS)

clean:
	rm -rf $(EXE) $(OBJS)

.cpp.o:
	$(CXX) $(CXXFLAGS) $(INCL) -c -o $@ `test -f '$<' || echo '$(SRCDIR)/'`$<


.cpp.obj:
	$(CXX) $(CXXFLAGS) $(INCL) -c -o $@ `if test -f '$<'; then $(CYGPATH_W) '$<'; else $(CYGPATH_W) '$(SRCDIR)/$<'; fi`

.c.o:
	$(CC) $(CFLAGS) $(INCL) -c -o $@ `test -f '$<' || echo '$(SRCDIR)/'`$<


.c.obj:
	$(CC) $(CFLAGS) $(INCL) -c -o $@ `if test -f '$<'; then $(CYGPATH_W) '$<'; else $(CYGPATH_W) '$(SRCDIR)/$<'; fi`
