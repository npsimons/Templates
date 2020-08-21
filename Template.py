#! /usr/bin/python3 -tt
# -*- coding: utf-8 -*-
# COPYRIGHT (C) 2020 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)
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

"""Simple template."""

# Turn on all warnings.
import warnings
warnings.simplefilter("always")

def hello_world():
    """Canonical introductory/demonstration program.

    >>> hello_world()
    Hello, world!
    """
    print("Hello, world!")

def print_arguments():
    """Access commandline arguments.

    >>> print_arguments()
    ./Template.py
    """
    from sys import argv
    for arg in argv:
        print(arg)

def __Template___function():
    """Basic function to print out commandline arguments.

    >>> __Template___function()
    Hello, world!
    ./Template.py
    """
    hello_world()
    print_arguments()

def _test():
    """Simple default test routine."""
    import doctest
    doctest.testmod(verbose=True)

if __name__ == "__main__":
    # Main entry if called standalone.
    _test()

# Local Variables:
#   mode: Python; tab-width: 4
# End:
# vi: fileformat=unix shiftwidth=4 tabstop=4 expandtab
