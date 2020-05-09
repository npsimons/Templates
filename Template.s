/*BINFMTASMCPP:
 */

/* Copyright (C) 2020 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)

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

/* IA32 assembly */
.text
    .global main
main:
    movl	$len,%edx
    movl	$helloworld,%ecx
    movl	$1,%ebx
    movl	$4,%eax
    int	$0x80
    movl	$0,%ebx
    movl	$1,%eax
    int	$0x80
.data
helloworld:
    .ascii	"Hello, world!\n"
    len = . - helloworld

/* Local Variables:
     mode: asm
   End:
   vi: fileformat=unix expandtab
*/
