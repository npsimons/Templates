/*BINFMTC: -DSTANDALONE
 */

/* Copyright (C) 2020 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/* For errno. */
#include <errno.h>

/* For fprintf(), perror(), stdout and puts(). */
#include <stdio.h>

/* For EXIT_SUCCESS and EXIT_FAILURE. */
#include <stdlib.h>

int TrabbPardoKnuth(void);

int TrabbPardoKnuth(void)
{
  int retval = EXIT_SUCCESS;

  if (fputs("Please input eleven (11) numbers\n", stdout) < 32)
    {
      retval = EXIT_FAILURE;
      perror("fputs()");
      goto TrabbPardoKnuth_cleanup;
    }
  
TrabbPardoKnuth_cleanup:
  return retval;
}

#if defined STANDALONE

/** Main entry to program.
 *
 *  Checks arguments, prints them out, prints "Hello, world!", prints a
 *  newline, then exits.
 *
 *  \param argc Number of arguments.
 *  \param argv Arguments.
 *  \return EXIT_SUCCESS success, EXIT_FAILURE otherwise.
 */
int
main(int argc,
     char *argv[])
{
  int retval = EXIT_SUCCESS;
  int index = 0;

  if (argc < 1 ||
      argv[index] == NULL)
    {
      retval = EXIT_FAILURE;
      perror("arguments error");
      goto main_cleanup;
    }

  for (index = 0; index < argc; index++)
    {
      if (fprintf(stdout, "%s\n", argv[index]) <= 0)
        {
          retval = EXIT_FAILURE;
          perror("fprintf()");
          goto main_cleanup;
        }
    }

  if (fputs("Hello, world!\n", stdout) < 0)
    {
      retval = EXIT_FAILURE;
      perror("fputs()");
      goto main_cleanup;
    }

 main_cleanup:
  /* Do cleanup here. */

  return retval;
}  /* int main (int argc, char *argv[]) */

#endif  /* #if defined STANDALONE */

/* Local Variables:
     mode: C
   End:
   vi: fileformat=unix expandtab shiftwidth=2 tabstop=2
*/
