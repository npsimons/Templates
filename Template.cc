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

#if defined STANDALONE

// For boost::type_index.
#  include <boost/type_index.hpp>

// For copy().
#  include <algorithm>

// For std::cout and std::endl.
#  include <iostream>

// For std::ostream_iterator<>.
#  include <iterator>

// For std::runtime_error() and std::exception.
#  include <stdexcept>

// For std::map<>.
#  include <map>

// For EXIT_SUCCESS and EXIT_FAILURE.
#  include <cstdlib>

void authenticateUser();

template<typename Container,
         typename Index>
decltype(auto)
authAndAccess(Container&& container_,
              Index index_)
{
  authenticateUser();
  return std::forward<Container>(container_)[index_];
}

template <typename Type>
void function(const Type& parameter_)
{
  using std::cout;
  using std::endl;
  using boost::typeindex::type_id_with_cvr;

  cout << "T =          "
       << type_id_with_cvr<Type>().pretty_name()
       << endl;
  cout << "parameter_ = "
       << type_id_with_cvr<decltype(parameter_)>().pretty_name()
       << endl;
}

class Widget
{
};

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
      
      std::map<int, int> m;

      for (const auto &i : { 0, 1, 2, 3, 4 })
        {
          m[i] = rand();
        }

      for (const auto& p : m)
        {
          cout << p.second << endl;
        }
    }
  catch(const std::exception& ex)  // try
    {
      std::cerr << "Exception raised: " << ex.what() << std::endl;
      return EXIT_FAILURE;
    }

  return EXIT_SUCCESS;
}  // int main(int argc, char* argv[])

#endif  // #if defined STANDALONE

// Local Variables:
//   mode: C++
// End:
// vi: fileformat=unix expandtab shiftwidth=2 tabstop=2
