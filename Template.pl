#! /usr/bin/perl -tTW
# Copyright (C) 2021 Nathan Paul Simons (2hmuFQDSHf-code@hardcorehackers.com)
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
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Restrict unsafe constructs.
use strict;

# Turn on all warnings.
use warnings;

# Enable stack backtrace on unexpected signals
use sigtrap;

# Force verbose warning diagnostics; not available in all Perls.
use diagnostics;

# Make english versions of cryptic automatic variables available.
use English qw( -no_match_vars );

# More informative death messages.
use Carp;

use version; our $VERSION = qv('0.0.1');

my $MESSAGE = q{Hello, world!};
print "$MESSAGE\n" or croak "Couldn't print(): $OS_ERROR\n";

# Local Variables:
#   mode: cperl
#   perl-indent-level: 4
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# vi: fileformat=unix filetype=perl shiftwidth=4 tabstop=4 expandtab
