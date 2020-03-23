# Copyright (C) 2014 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Turn on as many warnings as possible for gcc; all these flags have
# been tested with gcc 4.4.5 on Debian 6.0.2. See the gcc manual
# (http://gcc.gnu.org/onlinedocs/gcc-4.4.6/gcc/Option-Index.html#Option-Index)
# for details.
c_warn_flags = '\
-pedantic \
-Wall \
-Wextra \
-Waggregate-return \
-Warray-bounds \
-Wattributes \
-Wbad-function-cast \
-Wcast-align \
-Wcast-qual \
-Wc++-compat \
-Wcomments \
-Wconversion \
-Wcoverage-mismatch \
-Wdeclaration-after-statement \
-Wdeprecated-declarations \
-Wdisabled-optimization \
-Wdiv-by-zero \
-Wendif-labels \
-Werror=implicit-function-declaration \
-Wfloat-equal \
-Wformat=2 \
-Wformat-contains-nul \
-Wformat-extra-args \
-Wformat-nonliteral \
-Wformat-security \
-Wformat-y2k \
-Wformat-zero-length \
-Wimplicit \
-Winit-self \
-Winline \
-Wint-to-pointer-cast \
-Winvalid-pch \
-Wlogical-op \
-Wlong-long \
-Wmissing-declarations \
-Wmissing-format-attribute \
-Wmissing-include-dirs \
-Wmissing-noreturn \
-Wmissing-prototypes \
-Wno-system-headers \
-Wmultichar \
-Wnested-externs \
-Wnormalized=nfc \
-Wold-style-definition \
-Woverflow \
-Woverlength-strings \
-Wpacked \
-Wpadded \
-Wpointer-arith \
-Wpointer-to-int-cast \
-Wpragmas \
-Wredundant-decls \
-Wshadow \
-Wstrict-overflow \
-Wstrict-prototypes \
-Wswitch-default \
-Wswitch-enum \
-Wtraditional \
-Wtraditional-conversion \
-Wundef \
-Wunreachable-code \
-Wunsafe-loop-optimizations \
-Wunused \
-Wunused-macros \
-Wvariadic-macros \
-Wvla \
-Wvolatile-register-var \
-Wwrite-strings \
'

# You can move flags from the above list to here if they are superfluous.
bad_c_warn_flags = '\
'

# Turn on as many warnings as possible for g++; all these flags have
# been tested with g++ 4.4.5 on Debian 6.0.2. See the gcc manual
# (http://gcc.gnu.org/onlinedocs/gcc-4.4.6/gcc/Option-Index.html#Option-Index)
# for details.
cxx_warn_flags = '\
-pedantic \
-Wall \
-Wextra \
-Warray-bounds \
-Wattributes \
-Wcast-align \
-Wcast-qual \
-Wcomments \
-Wconversion \
-Wcoverage-mismatch \
-Wctor-dtor-privacy \
-Wdeprecated \
-Wdeprecated-declarations \
-Wdisabled-optimization \
-Wdiv-by-zero \
-Weffc++ \
-Wendif-labels \
-Wfloat-equal \
-Wformat-contains-nul \
-Wformat-extra-args \
-Wformat-nonliteral \
-Wformat-security \
-Wformat-y2k \
-Wimplicit \
-Winit-self \
-Winvalid-offsetof \
-Winvalid-pch \
-Wlogical-op \
-Wlong-long \
-Wmain \
-Wmissing-declarations \
-Wmissing-format-attribute \
-Wmissing-include-dirs \
-Wmissing-noreturn \
-Wmultichar \
-Wnon-template-friend \
-Wnon-virtual-dtor \
-Wold-style-cast \
-Woverflow \
-Woverlength-strings \
-Woverloaded-virtual \
-Wpacked \
-Wpmf-conversions \
-Wpointer-arith \
-Wpragmas \
-Wredundant-decls \
-Wshadow \
-Wsign-promo \
-Wstrict-null-sentinel \
-Wstrict-overflow \
-Wswitch-default \
-Wswitch-enum \
-Wsynth \
-Wundef \
-Wunsafe-loop-optimizations \
-Wunused \
-Wunused-macros \
-Wvariadic-macros \
-Wvla \
-Wvolatile-register-var \
-Wwrite-strings \
'

# You can move flags from the above list to here if they are
# superfluous.
bad_cxx_warn_flags = '\
-Wabi \
-Waggregate-return \
-Winline \
-Wpadded \
-Wunreachable-code \
'

# This will actually generate a superfluous warning if optimization
# isn't turned on, so we separate it out to use it only with
# optimization.
optim_warn_flags = '\
-Wuninitialized \
'

# This adds the highest level of debugging symbols.
debug_flags = '\
-g3 \
'

# This enables stack smashing protection; see the GCC documentation for
# details.
# http://gcc.gnu.org/onlinedocs/gcc-4.4.6/gcc/Optimize-Options.html#index-fstack_002dprotector_002dall-797
stackpro_flags = '\
-fstack-protector-all \
-Wstack-protector \
'

# This will cause some lightweight checks to be performed that will
# check for buffer overflows; it is specific to GNU libc 2.3.4 and
# above.
# http://fedoraproject.org/wiki/Security/Features#Compile_Time_Buffer_Checks_.28FORTIFY_SOURCE.29
fortify_flags = '\
-D_FORTIFY_SOURCE=2 \
'

# Fortification requires at least minimal optimization; it should be run
# at different optimization levels to flush out bugs.
fortO1_flags = fortify_flags + optim_warn_flags + '-O1 '

fortO2_flags = fortify_flags + optim_warn_flags + '-O2 '

fortO3_flags = fortify_flags + optim_warn_flags + '-O3 '

# Electric Fence is a malloc debugger.
# http://linux.die.net/man/3/efence
# http://en.wikipedia.org/wiki/Electric_Fence
efence_flags = '\
-lefence \
'

# ccmalloc is a malloc debugger.
# http://cs.ecs.baylor.edu/~donahoo/tools/ccmalloc/
ccmalloc_flags = '\
/usr/lib/ccmalloc-g++.o \
-lccmalloc \
-ldl \
'

# dmalloc is a malloc debugger.
# http://dmalloc.com/
dmalloc_flags = '\
-DDMALLOC \
-DMALLOC_FUNC_CHECK \
-ldmalloc \
'

# DUMA is a malloc debugger.
# http://duma.sourceforge.net/
duma_flags = '\
-lduma \
'

optim_flags = '\
-g0 \
-O3 \
'

# Generate position independent code that can only be linked into
# executables.
pie_flags = '\
-fPIE \
-pie \
-Wl,-pie \
'

rolink_flags = '\
-Wl,-z,relro \
'

imlink_flags = '\
-Wl,-z,now \
'

# Include directories for headers.
my_parse_flags = '\
-I. \
-L. \
'

extension = ''

cflags = c_warn_flags
cxxflags = cxx_warn_flags

# Commandline argument parsing.
if ARGUMENTS.get('debug', 0):
    # Turn on default debugging flags
    my_parse_flags += debug_flags + '-O0 '
    extension = '_debug'
elif ARGUMENTS.get('stackpro', 0):
    # Turn on stack smashing protection (see GCC docs).
    cflags += stackpro_flags
    cxxflags += stackpro_flags
    my_parse_flags += '-O0 '
    extension = '_stackpro'
elif ARGUMENTS.get('fortsrc1', 0):
    # Turn on source fortification against common buffer problems (see
    # features(7))
    my_parse_flags += fortO1_flags
    extension = '_fortsrc1'
elif ARGUMENTS.get('fortsrc2', 0):
    # Turn on source fortification against common buffer problems (see
    # features(7))
    my_parse_flags += fortO2_flags
    extension = '_fortsrc2'
elif ARGUMENTS.get('fortsrc3', 0):
    # Turn on source fortification against common buffer problems (see
    # features(7))
    my_parse_flags += fortO3_flags
    extension = '_fortsrc3'
elif ARGUMENTS.get('duma', 0):
    # Link against DUMA memory error detection library.
    my_parse_flags += duma_flags + '-O0 '
    extension = '_duma'
elif ARGUMENTS.get('efence', 0):
    # Link against Electric Fence memory error detection library.
    my_parse_flags += efence_flags + '-O0 '
    extension = '_efence'
elif ARGUMENTS.get('ccmalloc', 0):
    # Use ccmalloc alloc() debug library.
    my_parse_flags += ccmalloc_flags + '-O0 '
    extension = '_ccmalloc'
elif ARGUMENTS.get('dmalloc', 0):
    # Use dmalloc alloc() debug library.
    my_parse_flags += dmalloc_flags + '-O0 '
    extension = '_dmalloc'
elif ARGUMENTS.get('optim', 0):
    # Crank up optimization; disable debug symbols.
    my_parse_flags += optim_flags
    extension = '_optim'
else:
    # Default flags.
    my_parse_flags += debug_flags
    my_parse_flags += fortO1_flags
    my_parse_flags += pie_flags
    my_parse_flags += imlink_flags
    my_parse_flags += rolink_flags
    my_parse_flags += stackpro_flags

# Sources for the __TEMPLATE__ library
__TEMPLATE___lib_srcs = [
    'Template.cc'
    ]

# This will create a static library.
StaticLibrary('__TEMPLATE__' + extension,
              source = __TEMPLATE___lib_srcs,
              CFLAGS = cflags,
              CXXFLAGS = cxxflags,
              parse_flags = my_parse_flags)

# This will create a shared library.
# SharedLibrary('__TEMPLATE__' + extension,
#               source = __TEMPLATE___lib_srcs,
#               CFLAGS = cflags,
#               CXXFLAGS = cxxflags,
#               parse_flags = my_parse_flags)

# Sources for unit tests of the __TEMPLATE__ library.
run_tests_app_srcs = [
    'test___TEMPLATE__.cc'
    ]

# This will build an executable that will run the unit tests against the
# __TEMPLATE__ library.
Program('run_tests' + extension,
        source = run_tests_app_srcs,
        CFLAGS = cflags,
        CXXFLAGS = cxxflags,
        parse_flags = my_parse_flags + '-DSTANDALONE -L. -l__TEMPLATE__' + extension)

# Local Variables:
#   mode: Python
#   indent-tabs-mode: nil
# End:
# vi: fileformat=unix filetype=python shiftwidth=4 tabstop=4 expandtab
