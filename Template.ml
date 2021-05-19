#! /usr/bin/env ocaml
(* Copyright (C) 2021 Nathan Paul Simons (2hmuFQDSHf-code@hardcorehackers.com)

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or (at
   your option) any later version.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.
*)

let hello =
  print_string "Hello, world!\n";
;;

(* let () =
   let window = GWindow.window ~title:"Hello" ~border_width:10 () in
   window#connect#destroy ~callback:GMain.Main.quit;
   let button = GButton.button ~label:"Hello World" ~packing:window#add () in
   button#connect#clicked ~callback:window#destroy;
   window#show ();
   GMain.Main.main () *)

(* Local Variables:
     mode: Tuareg
   End:
   vi: fileformat=unix expandtab
*)
