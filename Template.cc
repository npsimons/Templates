/*BINFMTCXX: -DSTANDALONE
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

#if defined STANDALONE

// For copy().
#  include <algorithm>

// For std::cout and std::endl.
#  include <iostream>

// For std::ostream_iterator<>.
#  include <iterator>

// For std::runtime_error() and std::exception.
#  include <stdexcept>

// For EXIT_SUCCESS.
#  include <cstdlib>

/** Main entry to program.
 *
 *  Checks arguments, prints them out, prints "Hello, world!", prints a
 *  newline, then exits.
 *
 *  This may seem like a contrived "hello, world", but it is meant as a
 *  template for quickly prototyping ideas (see the binfmtc package
 *  which allows scripting with C, C++, Assembly, Java, FORTRAN and
 *  Pascal). It is also designed to compile with as few errors and
 *  warnings as possible, even with all warnings enabled. Lastly, it
 *  shows how to access commandline arguments, program using STL, and
 *  do some basic sanity checking.
 *
 *  \param argc Number of arguments.
 *  \param argv Arguments.
 *  \return EXIT_SUCCESS.
 *  \exception std::runtime_error Non-conformant arguments.
 */
int main(int argc,
         char* argv[])
{
  try
    {
      using std::cout;
      using std::endl;
      using std::ostream_iterator;
      using std::runtime_error;

      if (argc < 1 ||
          argv[0] == nullptr)
        throw runtime_error("arguments error");

      copy(argv,
           argv + argc,
           ostream_iterator<char*>(cout, "\n"));

      cout << "Hello, world!" << endl;
    }
  catch(const std::exception& ex)  // try
    {
      std::cerr << "Exception raised: " << ex.what() << std::endl;
      return 1;
    }

  return EXIT_SUCCESS;
}  // int main(int argc, char* argv[])

#endif  // #if defined STANDALONE

// Local Variables:
//   mode: C++
// End:
// vi: fileformat=unix expandtab shiftwidth=2 tabstop=2
