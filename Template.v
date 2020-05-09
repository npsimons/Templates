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

module hello(clk);
   input clk;
   always @(posedge clk) $display("Hello, world!");
endmodule // hello
module main();
   reg clk;
   hello H1(clk);
   initial begin
      #0 clk=0;
      #23 $display("--23--");
      #100 $finish;
   end
   always #5 clk=~clk;
endmodule // main

/* Local Variables:
     mode: Verilog
   End:
   vi: fileformat=unix expandtab
 */
