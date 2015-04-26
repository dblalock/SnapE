## Source directory

#SUBDIRS = examples

# header files
h_sources = include/stringlib.h \
			include/pad.h \
			include/trim.h \
			include/format.h \
			include/chomp.h

cc_sources = src/stringlib.cpp src/format.cpp

library_includedir=$(includedir)/$(GENERIC_LIBRARY_NAME)-$(GENERIC_API_VERSION)/$(GENERIC_LIBRARY_NAME)
library_include_HEADERS = $(h_sources)

INCLUDES = -I$(top_srcdir)

# Rules for the test code (use `make check` to execute)
TESTS = UnitTests
check_PROGRAMS = $(TESTS)
UnitTests_SOURCES = unit_test/unit_test_main.cpp unit_test/test_pad.cpp \
unit_test/test_trim.cpp unit_test/test_case.cpp unit_test/test_format.cpp

UnitTests_CXXFLAGS = $(CPPUNIT_CFLAGS)
UnitTests_LDFLAGS = -lstringlib-0.1 -lcppunit -ldl

lib_LTLIBRARIES= libstringlib-0.1.la
libstringlib_0_1_la_SOURCES= $(h_sources) $(cc_sources)
#libagavelib_0_1_la_LIBADD= libsub.la
libstringlib_0_1_la_LDFLAGS= -version-info $(GENERIC_LIBRARY_VERSION) -release $(GENERIC_RELEASE)

