/*BINFMTC: -DSTANDALONE___TEMPLATE__
 */

/* Copyright (C) 2014 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or (at
   your option) any later version.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __TEMPLATE___H_
#  define __TEMPLATE___H_

#  ifdef __cplusplus
extern "C"
{
#  endif  /* #  ifdef __cplusplus */

#  ifdef STANDALONE___TEMPLATE__

  /* For puts(). */
#    include <stdio.h>

  /* For errno. */
#    include <errno.h>

#    define main_cleanup()                      \
  {                                             \
  }  /* #      define main_cleanup() */

#    define main_error(a)                       \
  {                                             \
    if (errno == 0) errno = -1;                 \
    perror(a);                                  \
    main_cleanup();                             \
    return errno;                               \
  }  /* #      define main_error(a) */

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
       char* argv[])
  {
    int ii = 0;

    if (argc < 1 ||
        argv[0] == NULL)
      {
        main_error("arguments error");
      }

    for (ii = 0; ii < argc; ii++)
      {
        if (fprintf(stdout, "%s\n", argv[ii]) <= 0)
          {
            main_error("fprintf()");
          }
      }

    if (fputs("Hello, world!\n", stdout) < 0)
      {
        main_error("fputs()");
      }

    /* Do some stuff here to test this header. */

    main_cleanup();
    return 0;
  }
#  endif  /* #  ifdef STANDALONE___TEMPLATE__ */

#  ifdef __cplusaplus
}  /* extern "C" */
#  endif  /* #  ifdef __cplusplus */

#endif  /* #ifndef __TEMPLATE___H_ */

/* Local Variables:
     mode: C
   End:
   vi: fileformat=unix expandtab shiftwidth=2 tabstop=2
*/
