//BINFMTGCJ: --main=Templates.Template

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

package Templates;

/**
   @author Nathan Paul Simons (2hmuFQDSHf-code@hardcorehackers.com)
   @version $Revision: 1.28 $
   @return
*/
public class Template {
  /**
     @author Nathan Paul Simons (2hmuFQDSHf-code@hardcorehackers.com)
     @version $Revision: 1.28 $
     @param args Arguments to the main function.
     @return
  */
  public static void main(final String[] args) {
    try {
      // Do some stuff which might not work.
      System.out.println("Hello, world!");
    } catch (Exception e) {
      // Do what error handling needs to be done.
      System.err.println("Caught Exception: " + e.getMessage());
    } finally {
      // Cleanup everything here.
      System.out.println("Cleaning up.");
    }
  }
}

/* Local Variables:
     mode: JDE
     mode: Java
   End:
   vi: fileformat=unix expandtab
*/
