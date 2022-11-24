#! /usr/bin/env sh
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

# Debugging/error checking options; see the bash manual page for details.

# Set the prompt for trace output.
# This sets the execution trace prompt string (PS4) to the program name
# ($0), "line" and line number ($LINENO) within the program.
if test ${LINENO:-set} != set; then
    PS4='$0 line $LINENO: '
else
    PS4='$0: '
fi

# Print shell input lines as they are read.
set -o verbose

# Print expanded commands.
set -o xtrace

# Exit immediately if a simple command fails.
set -o errexit

# Don't overwrite existing files.
# NOTE: this only applies to shell-script things like redirection; the
# executables called below will still be able to overwrite files.
set -o noclobber

# Treat unset variables as an error.
set -o nounset

# Fail if any command in a pipeline fails; non-POSIX shell extension.
if test "${BASH_VERSION:-set}" != set; then
    set -o pipefail
fi

show_help()
{
    echo "$0: A template shell script for quick prototyping and testing."
    echo "  -h, -?, --help   Print this help message."
    echo "  -v, --verbose    Be verbose."
}

if test $# -eq 0; then
   show_help

   MESSAGE="Hello, world!"
   echo $MESSAGE
fi

optspec="hf:v-:"
while getopts "${optspec}" optchar; do
    case "${optchar}" in
        -)
            case "${OPTARG}" in
                help)
                    show_help
                    exit 0
                    ;;
                verbose)
                    verbose=1
                    ;;
                *)
                    echo "Unrecognized option --${OPTARG}."
                    show_help
                    exit 1
                    ;;
            esac;;
        h|\?)
            show_help
            exit 0
            ;;
        v)
            verbose=1
            ;;
        f)
            output_file=$OPTARG
            ;;
        ?)
            echo "Unrecognized option -${optchar}."
            show_help
            exit 1
            ;;
    esac
done

# Local Variables:
#   mode: Shell-Script
#   sh-indentation: 4
#   indent-tabs-mode: nil
#   sh-basic-offset: 4
# End:
# vi: fileformat=unix filetype=sh shiftwidth=4 tabstop=4 expandtab
