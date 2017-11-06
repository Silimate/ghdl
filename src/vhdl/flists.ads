--  Fixed-length lists.
--  Copyright (C) 2017 Tristan Gingold
--
--  GHDL is free software; you can redistribute it and/or modify it under
--  the terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 2, or (at your option) any later
--  version.
--
--  GHDL is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or
--  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with GHDL; see the file COPYING.  If not, write to the Free
--  Software Foundation, 59 Temple Place - Suite 330, Boston, MA
--  02111-1307, USA.
with Types; use Types;
with Nodes; use Nodes;

package Flists is
   type Flist_Type is new Int32;
   for Flist_Type'Size use 32;

   --  Non-existing flist.
   Null_Flist : constant Flist_Type := 0;

   --  Predefined special flist that could be used as a marker.
   Flist_Others : constant Flist_Type := 1;
   Flist_All : constant Flist_Type := 2;

   --  Create a new flist of length LEN.  All the elements are initialized to
   --  Null_Node.
   function Create_Flist (Len : Natural) return Flist_Type;

   --  Deallocate FLIST.  Set to Null_Flist.
   procedure Destroy_Flist (Flist : in out Flist_Type);

   --  First and last index of FLIST.  Could be used to iterate.
   Ffirst : constant Natural := 0;
   function Flast (Flist : Flist_Type) return Natural;

   --  Return the length of FLIST.
   function Length (Flist : Flist_Type) return Natural;

   --  Get the N-th element of FLIST.  First element has index 0.
   function Get_Nth_Element (Flist : Flist_Type; N : Natural) return Node_Type;

   --  Set the N-th element of FLIST to V.
   procedure Set_Nth_Element (Flist : Flist_Type; N : Natural; V : Node_Type);
end Flists;
