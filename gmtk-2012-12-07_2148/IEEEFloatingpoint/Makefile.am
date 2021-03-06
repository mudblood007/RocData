if HAVE_HG
# this will keep the Mercurial revision id current if you're building 
# in a working directory. If you're not, use the distributed hgstamp.h
VERSIONFLAG = -DHGID="\"`hg id`\"" -DHGDATE="\"`hg parents --template '{date|date}'`\""
else
VERSIONFLAG = 
endif

EXCCFLAGS = 
EXCXXFLAGS = 
EXLDFLAGS  = 
DEBUGFLAGS = -g
if NO_ASSERTIONS
DEBUGFLAGS += -DNDEBUG
endif
if NO_MODEL_CHECKS
DEBUGFLAGS += -DNMODELCHECK
endif
OPTFLAGS = -O3

ANSI = -ansi
PEDANTIC = -pedantic
WALL = -Wall

# Build libIEEEsupport.a, but don't install it in $(libdir)
noinst_LIBRARIES = libIEEEsupport.a

# The source files libIEEEsupport.a depends on. This depends on both
# the CPU (FPU) and OS, which are identified by autoconf
nodist_libIEEEsupport_a_SOURCES = \
ieeeFPsetup.h \
ieeeFPsetup_@host_cpu@_@host_os@.h \
ieeeFPsetup_@host_cpu@_@host_os@.cc

# The clients want to include ieeeFPsetup.h wihtout caring
# about the platform. We'll link the platform-specific
# header to create it.
BUILT_SOURCES = ieeeFPsetup.h
CLEANFILES = ieeeFPsetup.h 

ieeeFPsetup.h: ieeeFPsetup_@host_cpu@_@host_os@.h
	$(AM_V_GEN)if test -f $(top_srcdir)/ieeeFPsetup_@host_cpu@_@host_os@.h; then \
	 $(LN_S) $(top_srcdir)/ieeeFPsetup_@host_cpu@_@host_os@.h ieeeFPsetup.h; \
	else \
	 $(LN_S) ieeeFPsetup_@host_cpu@_@host_os@.h ieeeFPsetup.h; \
	fi

if UNKNOWN_PLATFORM
DISTCLEANFILES = ieeeFPsetup_@host_cpu@_@host_os@.h ieeeFPsetup_@host_cpu@_@host_os@.cc
endif

# Compilation flags for IEEEsupport library objects (user's CXXFLAGS will
# be appended)
libIEEEsupport_a_CXXFLAGS = $(VERSIONFLAG) \
$(DEBUGFLAGS) $(OPTFLAGS) $(EXCXXFLAGS) $(WALL) $(ANSI) $(PEDANTIC)
libIEEEsupport_a_CFLAGS = $(VERSIONFLAG) \
$(DEBUGFLAGS) $(OPTFLAGS) $(EXCCFLAGS) $(WALL) $(ANSI) $(PEDANTIC)

AM_CPPFLAGS = -I$(srcdir)/../miscSupport

# Only files listed explicitly in a primary are included in the distribution.
# That would leave out the IEEEsupport files for all the platforms except
# the host's. So this lists them all to be sure they're included.
EXTRA_DIST = \
ieeeFPsetup_ANY_ANY.cc \
ieeeFPsetup_ANY_ANY.h \
ieeeFPsetup_cygwin.cc \
ieeeFPsetup_cygwin.h \
ieeeFPsetup_ibm.cc \
ieeeFPsetup_ibm.h \
ieeeFPsetup_osx.cc \
ieeeFPsetup_osx.h \
ieeeFPsetup_solaris.cc \
ieeeFPsetup_solaris.h \
ieeeFPsetup_x86_64_linux-gnu.cc \
ieeeFPsetup_x86_64_linux-gnu.h 


check_PROGRAMS = ieeeTest
ieeeTest_SOURCES = ieeeTest.cc
ieeeTest_LDADD = libIEEEsupport.a

