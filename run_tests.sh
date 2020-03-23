#! /usr/bin/env sh
# Copyright (C) 2014 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Run a multitude of tests on software, both source code and binaries,
# static and dynamic checking. Tools used (if available):
#
# Static:
# checkstyle
# cppcheck
# cpplint
# flawfinder
# ftnchek
# gcc's -Wall -Wextra -pedantic flags (plus many more)
# hlint
# jlint
# perlcritic
# pmccabe
# pscan
# pychecker
# pyflakes
# pylint
# rats
# sloccount
# splint

# Dynamic:
# abicheck
# bfbtester
# ccmalloc
# defining _FORTIFY_SOURCE for headers that will use it
# dmalloc
# duma
# electric-fence
# fuzz
# gcc's -fstack-protector-all flag
# leaktracer
# libc's MALLOC_CHECK_ environment variable
# valgrind

# TODO: Look into using the following:
# antic
# checkbashisms
# clang/llvm
# coccinelle
# doctorj
# doxygen
# fdupes
# frama-c
# gcov
# gprof
# icheck
# licensecheck
# sonar
# sparse
# vera++
# weblint
# yasca
# zzuf
# abi-compliance-checker
# cccc
# ckport
# clirr
# kwstyle
# adlint
# dehydra

# Script debugging/error checking options; see the bash manual page for
# details.

# Set the prompt for trace output.
# This sets the execution trace prompt string (PS4) to the program name
# ($0), "line" and line number ($LINENO) within the program.
if test ${LINENO:-set} != set; then
    PS4='$0 line $LINENO: '
else
    PS4='$0: '
fi

# Print shell input lines as they are read.
#set -o verbose

# Print expanded commands.
#set -o xtrace

# Exit immediately if a simple command fails - disabled due to some
# tests failing on warnings.
#set -o errexit

# Don't overwrite existing files.
# NOTE: this only applies to shell-script things like redirection; the
# executables called below will still be able to overwrite files.
set -o noclobber

# Treat unset variables as an error.
set -o nounset

# Fail if any command in a pipeline fails; non-POSIX shell extension.
if test ${BASH_VERSION:-set} != set; then
    set -o pipefail
fi

# Filename extensions (case insensitive) for tools that have to have
# filenames passed to them.
c_extensions="c h"
cpp_extensions="cc hh"
fortran_extensions="f for ftn f90 f95 f03 f08 fpp"
haskell_extensions="hs lhs hi"
python_extensions="py"

# Run static analyses.

# If available, run checkstyle on source code.
# http://checkstyle.sourceforge.net/
run_checkstyle() {
    if [ ! -z `command -v checkstyle` ] ; then
        echo
        echo "    **** checkstyle ****    "
        echo
        checkstyle \
            -c /usr/share/checkstyle/sun_checks.xml \
            -r \
            .
    else
        echo "WARNING: checkstyle not found"
    fi
}

# If available, run cppcheck on source code.
# http://cppcheck.sourceforge.net/
run_cppcheck() {
    if [ ! -z `command -v cppcheck` ] ; then
        echo
        echo "    **** cppcheck ****    "
        echo
        cppcheck \
            --enable=all \
            .
    else
        echo "WARNING: cppcheck not found"
    fi
}

# If available, run cpplint.py (from Google) on source code.
# http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py
run_cpplint() {
    if [ ! -z `command -v cpplint.py` ] ; then
        echo
        echo "    **** cpplint.py ****    "
        echo
        for ext in $cpp_extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                cpplint.py \
                --counting=detailed
        done
    else
        echo "WARNING: cpplint.py not found"
    fi
}

# If available, run flawfinder on source code.
# http://www.dwheeler.com/flawfinder/
run_flawfinder() {
    if [ ! -z `command -v flawfinder` ] ; then
        echo
        echo "    **** flawfinder ****    "
        echo
        flawfinder \
            --followdotdir \
            --neverignore \
            --minlevel=0 \
            .
    else
        echo "WARNING: flawfinder not found"
    fi
}

# If available, run ftnchek on source code.
# http://www.dsm.fordham.edu/~ftnchek/
run_ftnchek() {
    if [ ! -z `command -v ftnchek` ] ; then
        echo
        echo "    **** ftnchek ****    "
        echo
        for ext in $fortran_extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                ftnchek \
                -division \
                -sixchar \
                -f77=all \
                -f90=all \
                -f95=all \
                -portability=all \
                -pretty=all \
                -style=all \
                -truncation=all \
                -usage=all
        done
    else
        echo "WARNING: ftnchek not found"
    fi
}

# If available, run hlint on source code.
# http://community.haskell.org/~ndm/hlint/
run_hlint() {
    if [ ! -z `command -v hlint` ] ; then
        echo
        echo "    **** hlint ****    "
        echo
        for ext in $haskell_extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                hlint
        done
    else
        echo "WARNING: hlint not found"
    fi
}

# If available, run jlint on source code.
# http://jlint.sourceforge.net/
run_jlint() {
    if [ ! -z `command -v jlint` ] ; then
        echo
        echo "    **** jlint ****    "
        echo
        extensions="class"
        for ext in $extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                jlint \
                +all
        done
    else
        echo "WARNING: jlint not found"
    fi
}

# If available, run perlcritic on source code.
# http://search.cpan.org/dist/Perl-Critic/bin/perlcritic
run_perlcritic() {
    if [ ! -z `command -v perlcritic` ] ; then
        echo
        echo "    **** perlcritic ****    "
        echo
        perlcritic \
            --exclude=RcsKeywords \
            --brutal \
            --statistics \
            --theme="\
                bugs || \
                complexity || \
                core || \
                cosmetic || \
                maintenance || \
                pbp || \
                performance || \
                portability || \
                readability || \
                security || \
                tests || \
                unicode \
                " \
            .
    else
        echo "WARNING: perlcritic not found"
    fi
}

# If available, run pmccabe on source code.
# http://www.parisc-linux.org/~bame/pmccabe/overview.html
run_pmccabe() {
    if [ ! -z `command -v pmccabe` ] ; then
        echo
        echo "    **** pmccabe ****    "
        echo
        pmccabe \
            `find \
            . \
            -type f \
            -iname "*.[c|h]*"` | \
            sort \
            --numeric \
            --reverse
    else
        echo "WARNING: pmccabe not found"
    fi
}

# If available, run pscan on source code.
# http://deployingradius.com/pscan/
run_pscan() {
    if [ ! -z `command -v pscan` ] ; then
        echo
        echo "    **** pscan ****    "
        echo
        extensions="$c_extensions $cpp_extensions"
        for ext in $extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                pscan \
                -w
        done
    else
        echo "WARNING: pscan not found"
    fi
}

# If available, run pychecker on source code.
# http://pychecker.sourceforge.net/
run_pychecker() {
    if [ ! -z `command -v pychecker` ] ; then
        echo
        echo "    **** pychecker ****    "
        echo
        for ext in $python_extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                pychecker \
                --level Style \
                --tuple \
                --members \
                --var \
                --allglobals \
                --namedargs \
                --initattr \
                --initsubclass \
                --unreachable \
                --constant1 \
                --callattr \
                --changetypes \
                --exec \
                --no-deprecated \
                --moduledoc \
                --classdoc \
                --funcdoc \
                --limit 1000
        done
    else
        echo "WARNING: pychecker not found"
    fi
}

# If available, run pyflakes on source code.
# http://pypi.python.org/pypi/pyflakes
run_pyflakes() {
    if [ ! -z `command -v pyflakes` ] ; then
        echo
        echo "    **** pyflakes ****    "
        echo
        pyflakes \
            .
    else
        echo "WARNING: pyflakes not found"
    fi
}

# If available, run pylint on source code.
# http://www.logilab.org/857
run_pylint() {
    if [ ! -z `command -v pylint` ] ; then
        echo
        echo "    **** pylint ****    "
        echo
        for ext in $python_extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                pylint
        done
    else
        echo "WARNING: pylint not found"
    fi
}

# If available, run RATS on source code.
# https://www.fortify.com/ssa-elements/threat-intelligence/rats.html
run_rats() {
    if [ ! -z `command -v rats` ] ; then
        echo
        echo "    **** rats ****    "
        echo
        rats \
            --warning 3 \
            --references \
            --input \
            .
    else
        echo "WARNING: rats not found"
    fi
}

# If available, run SLOCCOUNT on source code.
# http://www.dwheeler.com/sloccount/
run_sloccount() {
    if [ ! -z `command -v sloccount` ] ; then
        echo
        echo "    **** sloccount ****    "
        echo
        sloccount \
            `pwd`
    else
        echo "WARNING: sloccount not found"
    fi
}

# If available, run splint on source code.
# http://www.splint.org/
# splint doesn't work on C++; this wouldn't normally be a problem,
# except that some people think it's okay to use .h for a C++ header
# file extension.  How can you tell on the command line that a header is
# C or C++?  You can't.
run_splint() {
    if [ ! -z `command -v splint` ] ; then
        echo
        echo "    **** splint ****    "
        echo
        for ext in $c_extensions ; do
            find \
                . \
                -type f \
                -iname "*.$ext" \
                -print0 | \
                xargs \
                --null \
                --no-run-if-empty \
                splint \
                -strict
        done
    else
        echo "WARNING: splint not found"
    fi
}

# Run dynamic analyses; assumptions:
#  1. You are using SCons to build (http://scons.org/).
#  2. Your build binary is named "run_tests" with an optional suffix for
#     differently compiled versions (such as "_stackpro").
#  3. You have as many warnings as possible turned on in your build
#     script.
#  4. You have different build targets for building with conflicting
#     debug options (such as malloc debuggers).

# GCC can compile programs with stack protecting code.
# http://gcc.gnu.org/onlinedocs/gcc-4.4.6/gcc/Optimize-Options.html#index-fstack_002dprotector_002dall-797
run_stackpro() {
    echo
    echo "    **** -fstack-protector-all ****    "
    echo
    scons stackpro=1
    ./run_tests_stackpro
}

# GCC can compile programs with some other bug detection builtin, and it
# works with optimizations, so we test it at every level.
# http://fedoraproject.org/wiki/Security/Features#Compile_Time_Buffer_Checks_.28FORTIFY_SOURCE.29
run_fortsrc() {
    echo
    echo "    **** -D_FORTIFY_SOURCE=2 -O1 ****    "
    echo
    scons fortsrc1=1
    ./run_tests_fortsrc1

    echo
    echo "    **** -D_FORTIFY_SOURCE=2 -O2 ****    "
    echo
    scons fortsrc2=1
    ./run_tests_fortsrc2

    echo
    echo "    **** -D_FORTIFY_SOURCE=2 -O3 ****    "
    echo
    scons fortsrc3=1
    ./run_tests_fortsrc3
}

# Check tests binary with abicheck.
# http://abicheck.sourceforge.net/
run_abicheck() {
    if [ ! -z `command -v abicheck` ] ; then
        echo
        echo "    **** abicheck ****    "
        echo
        scons
        abicheck \
            -k \
            ./run_tests
    else
        echo "WARNING: abicheck not found"
    fi
}

# Check tests binary with bfbtester.
# http://bfbtester.sourceforge.net/
run_bfbtester() {
    if [ ! -z `command -v bfbtester` ] ; then
        echo
        echo "    **** bfbtester ****    "
        echo
        scons
        bfbtester \
            -t \
            -d 2 \
            -a \
            ./run_tests
    else
        echo "WARNING: bfbtester not found"
    fi
}

# ccmalloc is a malloc debugger.
# http://cs.ecs.baylor.edu/~donahoo/tools/ccmalloc/
run_ccmalloc() {
    echo
    echo "    **** ccmalloc ****    "
    echo
    scons ccmalloc=1
    ./run_tests_ccmalloc
}

# dmalloc is a malloc debugger.
# http://dmalloc.com/
run_dmalloc() {
    echo
    echo "    **** dmalloc ****    "
    echo
    scons dmalloc=1
    eval `dmalloc -i 1 high`
    ./run_tests_dmalloc
}

# DUMA is a malloc debugger.
# http://duma.sourceforge.net/
run_duma() {
    echo
    echo "    **** -lduma ****    "
    echo
    scons duma=1
    DUMA_ALIGNMENT=0 \
        DUMA_PROTECT_FREE=1 \
        DUMA_FREE_WIPES=1 \
        DUMA_PROTECT_BELOW=0 \
        ./run_tests_duma
    DUMA_ALIGNMENT=0 \
        DUMA_PROTECT_FREE=1 \
        DUMA_FREE_WIPES=1 \
        DUMA_PROTECT_BELOW=1 \
        ./run_tests_duma
}

# Electric Fence is a malloc debugger.
# http://linux.die.net/man/3/efence
# http://en.wikipedia.org/wiki/Electric_Fence
run_efence() {
    echo
    echo "    **** -lefence ****    "
    echo
    scons efence=1
    EF_ALIGNMENT=0 \
        EF_PROTECT_FREE=1 \
        EF_FREE_WIPES=1 \
        EF_PROTECT_BELOW=0 \
        ./run_tests_efence
    EF_ALIGNMENT=0 \
        EF_PROTECT_FREE=1 \
        EF_FREE_WIPES=1 \
        EF_PROTECT_BELOW=1 \
        ./run_tests_efence
}

# Check tests binary with fuzz.
# http://freecode.com/projects/fuzz
run_fuzz() {
    if [ ! -z `command -v fuzz` ] ; then
        echo
        echo "    **** fuzz ****    "
        echo
        scons
        fuzz \
            --args \
            --dontask \
            `pwd`/run_tests
    else
        echo "WARNING: fuzz not found"
    fi
}

# Check tests binary with leak-tracer.
# http://www.andreasen.org/LeakTracer/
run_leaktracer() {
    if [ ! -z `command -v leak-analyze` ] ; then
        echo
        echo "    **** leaktracer ****    "
        echo
        scons
        LeakCheck \
            ./run_tests
        leak-analyze \
            ./run_tests
    else
        echo "WARNING: leaktracer not found"
    fi
}

# Check tests binary with valgrind tools.
# http://valgrind.org/
run_cachegrind() {
    if [ ! -z `command -v valgrind` ] ; then
        echo
        echo "    **** valgrind: cachegrind ****    "
        echo
        scons
        valgrind \
            --trace-children=yes \
            --track-fds=yes \
            --time-stamp=yes \
            --smc-check=all \
            --tool=cachegrind \
            --branch-sim=yes \
            ./run_tests
    else
        echo "WARNING: valgrind not found"
    fi
}

run_callgrind() {
    if [ ! -z `command -v valgrind` ] ; then
        echo
        echo "    **** valgrind: callgrind ****    "
        echo
        scons
        valgrind \
            --trace-children=yes \
            --track-fds=yes \
            --time-stamp=yes \
            --smc-check=all \
            --tool=callgrind \
            --simulate-cache=yes \
            ./run_tests
    else
        echo "WARNING: valgrind not found"
    fi
}

run_helgrind() {
    if [ ! -z `command -v valgrind` ] ; then
        echo
        echo "    **** valgrind: helgrind ****    "
        echo
        scons
        valgrind \
            --trace-children=yes \
            --track-fds=yes \
            --time-stamp=yes \
            --smc-check=all \
            --tool=helgrind \
            ./run_tests
    else
        echo "WARNING: valgrind not found"
    fi
}

run_massif() {
    if [ ! -z `command -v valgrind` ] ; then
        echo
        echo "    **** valgrind: massif ****    "
        echo
        scons
        valgrind \
            --trace-children=yes \
            --track-fds=yes \
            --time-stamp=yes \
            --smc-check=all \
            --tool=massif \
            --stacks=yes \
            ./run_tests
    else
        echo "WARNING: valgrind not found"
    fi
}

run_memcheck() {
    if [ ! -z `command -v valgrind` ] ; then
        echo
        echo "    **** valgrind: memcheck ****    "
        echo
        scons
        valgrind \
            --tool=memcheck \
            --track-fds=yes \
            --time-stamp=yes \
            --smc-check=all \
            --trace-children=yes \
            --leak-check=full \
            --show-reachable=yes \
            ./run_tests;
    else
        echo "WARNING: valgrind not found"
    fi
}

# Run some other tools on our tests.

# libc supports memory checking via the MALLOC_CHECK_ environment
# variable.
# http://www.novell.com/support/viewContent.do?externalId=3113982&sliceId=1
# http://linux.die.net/man/3/malloc
run_malloc_check() {
    echo
    echo "    **** MALLOC_CHECK_=3 ****    "
    echo
    scons
    MALLOC_CHECK_=3 ./run_tests
}

if [ $# -gt 0 ] ; then
    # If arguments are present, select tests based on the arguments.
    while [ $# -gt 0 ] ; do
        case "$1" in
            abicheck)  abicheck=on;;
            bfbtester)  bfbtester=on;;
            cachegrind)  cachegrind=on;;
            callgrind)  callgrind=on;;
            ccmalloc)  ccmalloc=on;;
            checkstyle)  checkstyle=on;;
            cppcheck)  cppcheck=on;;
            cpplint)  cpplint=on;;
            dmalloc)  dmalloc=on;;
            duma)  duma=on;;
            efence)  efence=on;;
            flawfinder)  flawfinder=on;;
            fortsrc)  fortsrc=on;;
            ftnchek)  ftnchek=on;;
            fuzz)  fuzz=on;;
            helgrind)  helgrind=on;;
            hlint)  hlint=on;;
            jlint)  jlint=on;;
            leaktracer)  leaktracer=on;;
            malloc_check)  malloc_check=on;;
            massif)  massif=on;;
            memcheck)  memcheck=on;;
            perlcritic)  perlcritic=on;;
            pmccabe)  pmccabe=on;;
            pscan)  pscan=on;;
            pychecker)  pychecker=on;;
            pyflakes)  pyflakes=on;;
            pylint)  pylint=on;;
            rats)  rats=on;;
            splint)  splint=on;;
            stackpro)  stackpro=on;;
            valgrind)
                cachegrind=on;
                callgrind=on;
                helgrind=on;
                massif=on;
                memcheck=on;;
        esac
        shift
    done
else
    # No arguments present; run all tests.
    abicheck=on;
    bfbtester=on;
    cachegrind=on;
    callgrind=on;
    ccmalloc=on;
    checkstyle=on;
    cppcheck=on;
    cpplint=on;
    dmalloc=on;
    duma=on;
    efence=on;
    flawfinder=on;
    fortsrc=on;
    ftnchek=on;
    fuzz=on;
    helgrind=on;
    hlint=on;
    jlint=on;
    leaktracer=on;
    malloc_check=on;
    massif=on;
    memcheck=on;
    perlcritic=on;
    pmccabe=on;
    pscan=on;
    pychecker=on;
    pyflakes=on;
    pylint=on;
    rats=on;
    sloccount=on;
    splint=on;
    stackpro=on;
fi

# Run selected tests.

# Static analyses.
if test ${checkstyle:-set} != set ; then
    run_checkstyle
fi
if test ${cppcheck:-set} != set ; then
    run_cppcheck
fi
if test ${cpplint:-set} != set ; then
    run_cpplint
fi
if test ${flawfinder:-set} != set ; then
    run_flawfinder
fi
if test ${ftnchek:-set} != set ; then
    run_ftnchek
fi
if test ${hlint:-set} != set ; then
    run_hlint
fi
if test ${jlint:-set} != set ; then
    run_jlint
fi
if test ${perlcritic:-set} != set ; then
    run_perlcritic
fi
if test ${pmccabe:-set} != set ; then
    run_pmccabe
fi
if test ${pscan:-set} != set ; then
    run_pscan
fi
if test ${pychecker:-set} != set ; then
    run_pychecker
fi
if test ${pyflakes:-set} != set ; then
    run_pyflakes
fi
if test ${pylint:-set} != set ; then
    run_pylint
fi
if test ${rats:-set} != set ; then
    run_rats
fi
if test ${sloccount:-set} != set ; then
    run_sloccount
fi
if test ${splint:-set} != set ; then
    run_splint
fi

# Dynamic analyses.
if test ${abicheck:-set} != set ; then
    run_abicheck
fi
if test ${bfbtester:-set} != set ; then
    run_bfbtester
fi
if test ${callgrind:-set} != set ; then
    run_callgrind
fi
if test ${cachegrind:-set} != set ; then
    run_cachegrind
fi
if test ${ccmalloc:-set} != set ; then
    run_ccmalloc
fi
if test ${dmalloc:-set} != set ; then
    run_dmalloc
fi
if test ${duma:-set} != set ; then
    run_duma
fi
if test ${efence:-set} != set ; then
    run_efence
fi
if test ${fortsrc:-set} != set ; then
    run_fortsrc
fi
if test ${fuzz:-set} != set ; then
    run_fuzz
fi
if test ${helgrind:-set} != set ; then
    run_helgrind
fi
if test ${leaktracer:-set} != set ; then
    run_leaktracer
fi
if test ${malloc_check:-set} != set ; then
    run_malloc_check
fi
if test ${massif:-set} != set ; then
    run_massif
fi
if test ${memcheck:-set} != set ; then
    run_memcheck
fi
if test ${stackpro:-set} != set ; then
    run_stackpro
fi
if test ${valgrind:-set} != set ; then
    run_valgrind
fi

# Local Variables:
#   mode: Shell-Script
#   sh-indentation: 4
#   indent-tabs-mode: nil
#   sh-basic-offset: 4
# End:
# vi: fileformat=unix expandtab filetype=sh shiftwidth=4 tabstop=4
