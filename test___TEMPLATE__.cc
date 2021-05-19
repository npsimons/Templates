/*BINFMTCXX: -DSTANDALONE
 */

// Copyright (C) 2021 Nathan Paul Simons (2hmuFQDSHf-code@hardcorehackers.com)
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
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// For __Template__.
// #include "__Template__.hh"

// For Templated Unit Tests; requires libtut
// (https://mrzechonek.github.io/tut-framework/).
#include <tut.h>

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
    // __Template__ obj;
    ensure("1 == 1", 1 == 1);
  }  // void __Template___object::test<1>()
}  // namespace tut

#if defined STANDALONE

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
    }  // if (argc < 1 || argv[0] == nullptr)

  tut::reporter reporter;
  tut::runner.get().set_callback(&reporter);

  try
    {
      tut::runner.get().run_tests();
    }
  catch(const std::exception& ex)
    {
      // try
      std::cerr << "tut raised ex: " << ex.what() << std::endl;
      return EXIT_FAILURE;
    }  // catch(const std::exception& ex)  // try

  return EXIT_SUCCESS;
}  // int main(int argc, char* argv[])

#endif  // #if defined STANDALONE

// Local Variables:
//   mode: C++
// End:
// vi: fileformat=unix expandtab shiftwidth=2 tabstop=2
