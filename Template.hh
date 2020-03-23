/*BINFMTCXX: -DSTANDALONE___TEMPLATE__ -DINSTANTIATE_TESTS
 */

// Copyright (C) 2014 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

/** \file

    This file is designed for rapid prototyping and iteration
    along the lines of Agile development; it breaks some rules about
    separating implementation from interface, but that is something
    that can easily be fixed later, if necessary. If you are using
    templates, much of the implementation has to be in header files
    anyway.

    There are three sections to this file:

    1. Implementation/interface - where you put the code that actually
       does stuff.

    2. Tests section - where you write tests in the libtut framework.

    3. Main section - where the tests are run.

    These sections are split up not just for ease of maintenance, but
    because it makes it possible to rapidly test and iterate code on a
    standalone basis, then seamlessly integrate the code with other
    modules. This is accomplished through use of preprocessor macros
    and defining the proper variables through a tool in Linux called
    binfmtc which allows C++ (and C, Pascal, Assembly, FORTRAN and Java)
    to be run as a script without compiling first.

    Replace __TEMPLATE__ with your header guard flag name, and
    __Template__ with the name of the class/namespace/collection of
    things you are testing.

    References:
    http://tut-framework.sourceforge.net/
    http://www.netfort.gr.jp/~dancer/software/binfmtc.html.en
 */

// Implementation/interface section; write your header as you normally
// would.
#if !defined __TEMPLATE___HH_
#  define __TEMPLATE___HH_

// Interface/implementation goes here.

#endif  // End of implementation/interface section.

// Unit tests section; write tests in the libtut framework for the
// implementation above.
// The following is necessary to avoid multiple definition when
// including this file; only one compilation unit in a collection that
// is being linked should define __TEMPLATE___TESTS_INSTANTIATED.
#if defined INSTANTIATE_TESTS && !defined __TEMPLATE___TESTS_INSTANTIATED
#  define __TEMPLATE___TESTS_INSTANTIATED

// For Templated Unit Tests.
#  include <tut.h>

namespace tut
{
struct __Template___data
{
};  // struct __Template___data

typedef test_group<__Template___data> __Template___factory;
typedef __Template___factory::object __Template___object;
__Template___factory __Template___group("__Template__");

/// Test something.
template<>
template<>
void __Template___object::test<1>()
{
    ensure("one is equal to one", 1 == 1);
}  // void __Template___object::test<1>()

/// Test something else.
template<>
template<>
void __Template___object::test<2>()
{
    ensure("two equals two", 2 == 2);
}  // void __Template___object::test<2>()
}  // namespace tut

#endif  // End of tests section.

// If we are running standalone, run our main to run the unit tests
// above.
#if defined STANDALONE___TEMPLATE__

// For tut::reporter.
#  include <tut_reporter.h>

// For std::cerr and std::endl.
#  include <iostream>

// For std::runtime_error().
#  include <stdexcept>

// For EXIT_SUCCESS.
#  include <cstdlib>

namespace tut
{
test_runner_singleton runner;
}  // namespace tut

/** Main entry to program.
 *
 *  Checks arguments, runs unit tests, then exits.
 *
 *  \param argc Number of arguments.
 *  \param argv Arguments.
 *  \return EXIT_SUCCESS.
 *  \exception std::runtime_error Non-conformant arguments.
 */
int main(int argc,
         char* argv[])
{
    if (argc < 1 ||
            argv[0] == nullptr)
        {
            throw std::runtime_error("arguments error");
        }  // if (argc < 1 || argv[0] == 0)

    tut::reporter reporter;
    tut::runner.get().set_callback(&reporter);

    try
        {
            tut::runner.get().run_tests();
        }
    catch (const std::exception& ex) // try
        {
            std::cerr << "tut raised ex: " << ex.what() << std::endl;
            return 1;
        }  // catch(const std::exception& ex)  // try

    return EXIT_SUCCESS;
}  // int main(int argc, char* argv[])

#endif  // End of main section for running standalone.

// Local Variables:
//   mode: C++
// End:
// vi: fileformat=unix expandtab shiftwidth=2 tabstop=2
