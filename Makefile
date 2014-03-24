srcdir = .
top_srcdir = .

top_builddir = .
my_dir = .
INSTALL = /usr/bin/install -c

# Beginning of file MCONFIG

all::

check::

SHELL = /bin/sh

COMPRESS_EXT = gz bz2 bz Z

prefix = /usr
root_prefix = 
exec_prefix = ${prefix}
root_bindir = ${root_prefix}/bin
root_sbindir = ${root_prefix}/sbin
root_libdir = ${root_prefix}/lib
datarootdir = ${prefix}/share
bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libdir = ${exec_prefix}/lib
datadir= ${datarootdir}
localedir = $(datadir)/locale
root_sysconfdir= ${root_prefix}/etc
includedir = ${prefix}/include
mandir = ${datarootdir}/man
man1dir = $(mandir)/man1
man3dir = $(mandir)/man3
man5dir = $(mandir)/man5
man8dir = $(mandir)/man8
infodir = ${datarootdir}/info
datadir = ${datarootdir}



 V =
 ifeq ($(strip $(V)),)
 #  E = @echo
 #  ES = echo
 #  Q = @
    E = @echo
    ES = echo
    Q = @
 else
    E = @\#
    ES = \#
    Q =
 endif

# E = @echo
# ES = echo
# Q = @

 CHECK=sparse
 CHECK_OPTS=-Wsparse-all -Wno-transparent-union -Wno-return-void -Wno-undef -Wno-non-pointer-null
 ifeq ("$(C)", "2")
   CHECK_CMD=$(CHECK) $(CHECK_OPTS) -Wbitwise -D__CHECK_ENDIAN__
 else
   ifeq ("$(C)", "1")
     CHECK_CMD=$(CHECK) $(CHECK_OPTS)
    else
     CHECK_CMD=@true
   endif
 endif

# CHECK_CMD=@true

CC = /usr/lib/ccache/gcc
BUILD_CC = /usr/lib/ccache/gcc
CFLAGS = -g3 -gdwarf-2
CPPFLAGS = -I. -I$(top_builddir)/lib -I$(top_srcdir)/lib
ALL_CFLAGS = $(CPPFLAGS) $(CFLAGS)
LDFLAGS = 
ALL_LDFLAGS = $(LDFLAGS) 
LDFLAGS_STATIC = $(LDFLAGS) 
BUILD_CFLAGS = -g3 -gdwarf-2 
BUILD_LDFLAGS = 
RDYNAMIC = -rdynamic
LINK_BUILD_FLAGS = 
LINK_INSTALL_FLAGS = -f
RM = /bin/rm
LN = /bin/ln
LN_S = ln -s
MV = /bin/mv
CP = /bin/cp
CHMOD = /bin/chmod
AR = ar
AWK = gawk
SED = /bin/sed
PERL = /usr/bin/perl
RANLIB = ranlib
STRIP = strip
LD = $(PURE) /usr/lib/ccache/gcc
ARUPD = $(AR) r
ARGEN = $(AR) rc
LDCONFIG = /sbin/ldconfig
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL}
MKINSTALLDIRS = $(top_builddir)/config/mkinstalldirs

#
# Library definitions
#
LIB = $(top_builddir)/lib
LIBSS = $(LIB)/libss.a  -ldl
LIBCOM_ERR = $(LIB)/libcom_err.a  -lpthread
LIBE2P = $(LIB)/libe2p.a
LIBEXT2FS = $(LIB)/libext2fs.a
LIBUUID = $(LIB)/libuuid.a 
LIBQUOTA = $(LIB)/libquota.a
LIBBLKID = $(LIB)/libblkid.a  $(LIBUUID)
LIBINTL = 
DEPLIBSS = $(LIB)/libss.a
DEPLIBCOM_ERR = $(LIB)/libcom_err.a
DEPLIBUUID = $(LIB)/libuuid.a
DEPLIBQUOTA = $(LIB)/libquota.a
DEPLIBBLKID = $(LIB)/libblkid.a  $(DEPLIBUUID)

STATIC_LIBSS = $(LIB)/libss.a -ldl
STATIC_LIBCOM_ERR = $(LIB)/libcom_err.a -lpthread
STATIC_LIBE2P = $(LIB)/libe2p.a
STATIC_LIBEXT2FS = $(LIB)/libext2fs.a
STATIC_LIBUUID = $(LIB)/libuuid.a 
STATIC_LIBQUOTA = $(LIB)/libquota.a
STATIC_LIBBLKID = $(LIB)/libblkid.a $(STATIC_LIBUUID)
DEPSTATIC_LIBSS = $(LIB)/libss.a
DEPSTATIC_LIBCOM_ERR = $(LIB)/libcom_err.a
DEPSTATIC_LIBUUID = $(LIB)/libuuid.a
DEPSTATIC_LIBQUOTA = $(LIB)/libquota.a
DEPSTATIC_LIBBLKID = $(LIB)/libblkid.a $(DEPSTATIC_LIBUUID)

PROFILED_LIBSS = $(LIB)/libss.a -ldl
PROFILED_LIBCOM_ERR = $(LIB)/libcom_err.a -lpthread
PROFILED_LIBE2P = $(LIB)/libe2p.a
PROFILED_LIBEXT2FS = $(LIB)/libext2fs.a
PROFILED_LIBUUID = $(LIB)/libuuid.a 
PROFILED_LIBQUOTA = $(LIB)/libquota.a
PROFILED_LIBBLKID = $(LIB)/libblkid.a $(PROFILED_LIBUUID)
DEPPROFILED_LIBSS = $(LIB)/libss.a
DEPPROFILED_LIBCOM_ERR = $(LIB)/libcom_err.a
DEPPROFILED_LIBUUID = $(LIB)/libuuid.a
DEPPROFILED_LIBQUOTA = $(LIB)/libquota.a
DEPPROFILED_LIBBLKID = $(LIB)/libblkid.a $(DEPPROFILED_LIBUUID)

#
# A fast substitution command for fixing up man pages, shell scripts, etc.
#
SUBST_CONF=$(top_builddir)/util/subst.conf
SUBSTITUTE= $(top_builddir)/util/subst -f $(SUBST_CONF)
SUBSTITUTE_UPTIME= $(top_builddir)/util/subst -t -f $(SUBST_CONF)
DEP_SUBSTITUTE= $(top_builddir)/util/subst $(SUBST_CONF)

$(top_builddir)/util/subst:
	cd $(top_builddir)/util ; $(MAKE) subst

#
# Script for installing symlinks (for shared libraries)
#
$(top_builddir)/util/install-symlink: $(top_srcdir)/util/install-symlink.in \
			      $(top_builddir)/config.status
	cd $(top_builddir); CONFIG_FILES=util/install-symlink ./config.status
	chmod +x $(top_builddir)/util/install-symlink

$(top_builddir)/util/symlinks:
	cd $(top_builddir)/util ; $(MAKE) symlinks

INSTALL_SYMLINK = /bin/sh $(top_builddir)/util/install-symlink \
			 \
			--symlinks=$(top_builddir)/util/symlinks
DEP_INSTALL_SYMLINK = $(top_builddir)/util/install-symlink \
			$(top_builddir)/util/symlinks

#
# Warning flags
#
# Run make gcc-wall to do a build with warning messages.
#
#
WFLAGS=		-std=c99 -D_XOPEN_SOURCE=600 -D_GNU_SOURCE \
			-pedantic $(WFLAGS_EXTRA) \
			-Wall -W -Wwrite-strings -Wpointer-arith \
			-Wcast-qual -Wcast-align -Wno-variadic-macros \
			-Wstrict-prototypes -Wmissing-prototypes \
			-Wformat-security  -Wformat-nonliteral \
			-Wmissing-format-attribute -O2 -Wstrict-aliasing \
			-Wnested-externs -Winline -DNO_INLINE_FUNCS -Wshadow \
			-UENABLE_NLS

gcc-wall-new:
	(make CFLAGS="-g3 -gdwarf-2 $(WFLAGS)" > /dev/null) 2>&1 | sed -f $(top_srcdir)/util/gcc-wall-cleanup 

gcc-wall:
	make clean > /dev/null
	make gcc-wall-new

#
# Installation user and groups
#
BINGRP=		bin
BINOWN=		bin
BINMODE=	555
INCGRP=		bin
INCOWN=		bin
INCMODE=	444
LIBOWN=		bin
LIBGRP=		bin
LIBMODE=	444
MANGRP=		bin
MANOWN=		bin
MANMODE=	444

#
# Autoconf magic...
#

DEP_LIB_MAKEFILES = $(top_srcdir)/lib/Makefile.library \
	$(top_srcdir)/lib/Makefile.elf-lib  \
	$(top_srcdir)/lib/Makefile.bsd-lib $(top_srcdir)/lib/Makefile.darwin-lib \
	$(top_srcdir)/lib/Makefile.solaris-lib $(top_srcdir)/lib/Makefile.checker \
	$(top_srcdir)/lib/Makefile.profile

$(top_builddir)/config.status: $(top_srcdir)/configure
	cd $(top_builddir); ./config.status --recheck

$(top_builddir)/MCONFIG: $(top_srcdir)/MCONFIG.in $(top_builddir)/config.status
	cd $(top_builddir); CONFIG_FILES=MCONFIG ./config.status

$(top_builddir)/lib/config.h: $(top_srcdir)/lib/config.h.in \
			      $(top_builddir)/config.status
	cd $(top_builddir); CONFIG_FILES=lib/config.h ./config.status

$(top_builddir)/lib/dirpaths.h: $(DEP_SUBSTITUTE) $(top_srcdir)/lib/dirpaths.h.in
	$(E) "	SUBST $@"
	$(Q) $(SUBSTITUTE) $(top_srcdir)/lib/dirpaths.h.in $@

$(top_builddir)/lib/substitute_sh: $(top_srcdir)/lib/substitute_sh.in \
		$(top_builddir)/config.status
	cd $(top_builddir); CONFIG_FILES=lib/substitute_sh ./config.status

$(top_builddir)/util/subst.conf: $(top_srcdir)/util/subst.conf.in \
		$(top_builddir)/config.status
	cd $(top_builddir); CONFIG_FILES=util/subst.conf ./config.status

Makefile: $(srcdir)/Makefile.in $(top_builddir)/MCONFIG \
		$(DEP_MAKEFILE) $(top_builddir)/config.status
	cd $(top_builddir); CONFIG_FILES=$(my_dir)/Makefile ./config.status

#$(top_srcdir)/configure: $(top_srcdir)/configure.in
#	cd $(top_srcdir) && autoheader && autoconf

#
# Make depend magic...
#

.depend: Makefile $(SRCS) $(top_srcdir)/depfix.sed $(top_srcdir)/wordwrap.pl
	if test -n "$(SRCS)" ; then \
		$(CC) -M $(ALL_CFLAGS) $(SRCS) | \
			$(SED) -f $(top_srcdir)/depfix.sed \
			    -e 's; $(srcdir)/; $$(srcdir)/;g' \
			    -e 's; $(top_srcdir)/; $$(top_srcdir)/;g' \
			    -e 's; $(top_builddir)/; $$(top_builddir)/;g' \
			    -e 's; \./; ;g' \
			    -e '/^#/d' \
			    -e '/^ *\\$$/d' | \
			$(PERL) $(top_srcdir)/wordwrap.pl > .depend; \
	else :; fi

depend:: .depend
	if test -n "$(SRCS)" ; then \
		sed -e '/^# +++ Dependency line eater +++/,$$d' \
			< $(srcdir)/Makefile.in | cat - .depend \
			> $(srcdir)/Makefile.in.new; \
	if cmp -s $(srcdir)/Makefile.in $(srcdir)/Makefile.in.new ; then \
		$(RM) $(srcdir)/Makefile.in.new ; \
	else \
		$(MV) $(srcdir)/Makefile.in $(srcdir)/Makefile.in.old; \
		$(MV) $(srcdir)/Makefile.in.new $(srcdir)/Makefile.in; \
	fi ; else :; fi

# End of file MCONFIG

% : %.sh

RESIZE_DIR= resize
DEBUGFS_DIR= debugfs
UUID_LIB_SUBDIR= lib/uuid
BLKID_LIB_SUBDIR= lib/blkid
QUOTA_LIB_SUBDIR= lib/quota

LIB_SUBDIRS=lib/et lib/ss lib/e2p $(UUID_LIB_SUBDIR) lib/ext2fs $(BLKID_LIB_SUBDIR) $(QUOTA_LIB_SUBDIR) intl
PROG_SUBDIRS=e2fsck $(DEBUGFS_DIR) misc $(RESIZE_DIR) tests/progs po
SUBDIRS=util $(LIB_SUBDIRS) $(PROG_SUBDIRS) tests

SUBS= util/subst.conf lib/config.h lib/dirpaths.h \
	lib/ext2fs/ext2_types.h lib/blkid/blkid_types.h lib/uuid/uuid_types.h

TAR=tar

all:: subs
	$(MAKE) libs
	$(MAKE) progs
	$(MAKE) docs

subs: $(DEP_SUBSTITUTE)
	@for i in $(SUBS) ; do if test -d `dirname $$i` ; \
		then $(MAKE) $$i || exit $$? ; fi ; done
	@(if test -d lib/et ; then cd lib/et && $(MAKE) compile_et; fi)
	@(if test -d lib/ext2fs ; then cd lib/ext2fs && $(MAKE) ext2_err.h; fi)

progs: all-progs-recursive
libs: all-libs-recursive
all-progs-recursive all-libs-recursive: subs

e2fsprogs.spec: $(DEP_SUBSTITUTE) e2fsprogs.spec.in
	cd $(top_builddir); CONFIG_FILES=./e2fsprogs.spec ./config.status

rpm: e2fsprogs.spec
	sh contrib/build-rpm

docs:
	-@test -d doc && cd doc && $(MAKE) libext2fs.info

install-doc-libs:
	-@test -d doc && cd doc && $(MAKE) install-doc-libs

uninstall-doc-libs:
	-@test -d doc && cd doc && $(MAKE) uninstall-doc-libs

clean-doc:
	-@test -d doc && cd doc && $(MAKE) clean

distclean-doc:
	-test -d doc && cd doc && $(MAKE) distclean

install: subs all-libs-recursive install-progs-recursive \
  install-shlibs-libs-recursive install-doc-libs
	if test ! -d e2fsck && test ! -d debugfs && test ! -d misc && test ! -d ext2ed ; then $(MAKE) install-libs ; fi

install-strip: subs all-libs-recursive install-strip-progs-recursive \
  install-shlibs-strip-libs-recursive install-doc-libs

uninstall: uninstall-progs-recursive uninstall-shlibs-libs-recursive uninstall-doc-libs

install-libs: install-libs-recursive

uninstall-libs: uninstall-libs-recursive

check-recursive: all

TAGS clean-recursive distclean-recursive depend-recursive check-recursive \
  mostlyclean-recursive realclean-recursive:
	@for subdir in $(SUBDIRS); do \
	  if test -d $$subdir ; then \
	    target=`echo $@|$(SED) 's/-recursive//'`; \
	    echo making $$target in $$subdir; \
	    (cd $$subdir && $(MAKE) $$target) || exit 1; \
	  fi ; \
	done

all-progs-recursive install-progs-recursive install-strip-progs-recursive \
  uninstall-progs-recursive: all-libs-recursive
	@for subdir in $(PROG_SUBDIRS); do \
	  if test -d $$subdir ; then \
	    target=`echo $@|$(SED) 's/-progs-recursive//'`; \
	    echo making $$target in $$subdir; \
	    (cd $$subdir && $(MAKE) $$target) || exit 1; \
	  fi ; \
	done

all-libs-recursive install-libs-recursive install-strip-libs-recursive \
  uninstall-libs-recursive install-shlibs-libs-recursive \
  install-shlibs-strip-libs-recursive uninstall-shlibs-libs-recursive:
	@for subdir in $(LIB_SUBDIRS); do \
	  if test -d $$subdir ; then \
	    target=`echo $@|$(SED) 's/-libs-recursive//'`; \
	    echo making $$target in $$subdir; \
	    (cd $$subdir && $(MAKE) $$target) || exit 1; \
	  fi ; \
	done

mostlyclean: mostlyclean-recursive mostlyclean-local

clean: clean-recursive clean-local clean-doc
	$(RM) -f $(SUBS) 

distclean: distclean-doc distclean-recursive
	$(RM) -rf autom4te.cache e2fsprogs.spec ext2ed/Makefile po/stamp-po
	$(MAKE) distclean-local 

realclean: realclean-recursive realclean-local

depend:: depend-recursive

lib/ext2fs/ext2_types.h: $(DEP_SUBSTITUTE) asm_types.h \
		$(srcdir)/lib/ext2fs/ext2_types.h.in
	cd $(top_builddir); CONFIG_FILES=./lib/ext2fs/ext2_types.h ./config.status

lib/blkid/blkid_types.h: $(DEP_SUBSTITUTE) asm_types.h \
		$(srcdir)/lib/blkid/blkid_types.h.in
	cd $(top_builddir); CONFIG_FILES=./lib/blkid/blkid_types.h ./config.status

lib/uuid/uuid_types.h: $(DEP_SUBSTITUTE) asm_types.h \
		$(srcdir)/lib/uuid/uuid_types.h.in
	cd $(top_builddir); CONFIG_FILES=./lib/uuid/uuid_types.h ./config.status

mostlyclean-local:
	$(RM) -f \#* *~ *.orig core MAKELOG 

clean-local: mostlyclean-local

distclean-local: clean-local
	$(RM) -f $(SUBS) $(SUBST_CONF) \
		config.status config.log config.cache MCONFIG Makefile \
		$(srcdir)/TAGS $(srcdir)/Makefile.in.old

realclean-local: distclean-local
	$(RM) -f configure

check::	all check-recursive

