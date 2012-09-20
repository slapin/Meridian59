# stuff included in blakston makefiles

# defining DYNAMIC uses multi-threaded C runtime DLL; 
# otherwise link statically with single-threaded lib

# defining RELEASE compiles optimized
# defining NODEBUG omits debugging information
# defining FINAL implies release, and also removes debugging strings from client executable 

ifdef FINAL
RELEASE = 1
NODPRINTFS = 1
endif

ifdef RELEASE
undef DEBUG
OUTDIR=release
else
DEBUG = 1
OUTDIR=debug
endif

# set to get debugging info in executable
ifdef NODEBUG
undef DEBUGINFO
else
DEBUGINFO = 1
endif

# Set source directories

# Subdirectories of components

BBGUNDIR    = $(TOPDIR)/bbgun
CLIENTDIR   = $(TOPDIR)/clientd3d
BLAKSERVDIR = $(TOPDIR)/blakserv
BLAKCOMPDIR = $(TOPDIR)/blakcomp
ROOMEDITDIR = $(TOPDIR)/roomedit
DOCDIR      = $(TOPDIR)/doc
DECODIR     = $(TOPDIR)/blakdeco
MAKEBGFDIR  = $(TOPDIR)/makebgf
RESOURCEDIR = $(TOPDIR)/resource
DIFFDIR     = $(TOPDIR)/blakdiff
MODULEDIR   = $(TOPDIR)/module
CRUSHERDIR  = $(TOPDIR)/crusher
UTILDIR     = $(TOPDIR)/util
SPROCKETDIR = $(TOPDIR)/sprocket
CLUBDIR     = $(TOPDIR)/club
KEYBINDDIR  = $(TOPDIR)/keybind
WAVEMIXDIR  = $(TOPDIR)/wavemix

BLAKBINDIR = $(TOPDIR)/bin
BLAKLIBDIR = $(TOPDIR)/lib
BLAKINCLUDEDIR = $(TOPDIR)/include
BLAKSERVRUNDIR = $(TOPDIR)/run/server
CLIENTRUNDIR = $(TOPDIR)/run/localclient

KODDIR = $(TOPDIR)/kod
KODINCLUDEDIR = $(KODDIR)/include

PALETTEFILE = $(TOPDIR)/blakston.pal

# compiler specs -- uses multi-threaded DLL C runtime library
# /TP builds C files in C++ mode
# /WX treats warnings as errors
# /GR- turns off RTTI
# /EHsc- turns off exceptions

#CCOMMONFLAGS = -nologo -DWIN32 -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -TP -WX -GR- -EHsc-
COMMONFLAGS = 

CNORMALFLAGS = $(CCOMMONFLAGS) -Wall -O2
CDEBUGFLAGS = $(CCOMMONFLAGS) -Wall -O0 -g -DBLAKDEBUG
CNODEBUGFLAGS = $(CCOMMONFLAGS) -Wall -DBLAKDEBUG
LINKNORMALFLAGS =
LINKDEBUGFLAGS = 
LINKNODEBUGFLAGS = 

ifdef DEBUG

ifdef DEBUGINFO
CFLAGS = $(CDEBUGFLAGS)
LINKFLAGS = $(LINKDEBUGFLAGS)
else
CFLAGS = $(CNODEBUGFLAGS)
LINKFLAGS = $(LINKNODEBUGFLAGS)
endif DEBUGINFO

else
CFLAGS = $(CNORMALFLAGS)
LINKFLAGS = $(LINKNORMALFLAGS)

endif DEBUG

ifdef DLL
LINKFLAGS = $(LINKFLAGS) /DLL
endif

ifdef DYNAMIC
CFLAGS += 
else
CFLAGS += 
endif DYNAMIC

ifdef NODPRINTFS
CFLAGS += -DNODPRINTFS
endif NODPRINTFS

# programs

CC     = gcc
LIBPRG = gcc
LINK   = gcc
RC     = echo rc

LEX = flex -I -i
YACC = bison -d -t
CP = cp
RM = -rm
RMDIR = -rm -R
MV = mv
LATEX = latex
MAKENSIS = "c:\program files (x86)\nsis\makensis.exe"

BC = $(BLAKBINDIR)\bc

# environment variables for compiler

LIB = $(LIB);$(BLAKLIBDIR);$(TOPDIR)\miles\lib
INCLUDE = $(INCLUDE);$(BLAKINCLUDEDIR);$(TOPDIR)\miles\include
