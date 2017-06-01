------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                     I N T E R F A C E S . A A R C H 6 4                  --
--                                                                          --
--                                   S p e c                                --
--                                                                          --
--                         Copyright (C) 2017, AdaCore                      --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
------------------------------------------------------------------------------

with System.Machine_Code;  use System.Machine_Code;
with Interfaces;           use Interfaces;

package body Interfaces.AArch64 is

   -------------------
   -- Get_CPACR_EL1 --
   -------------------

   function Get_CPACR_EL1 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, cpacr_el1",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_CPACR_EL1;

   -------------------
   -- Set_CPACR_EL1 --
   -------------------

   procedure Set_CPACR_EL1 (Val : Unsigned_64) is
   begin
      Asm ("msr cpacr_el1, %0",
           Inputs => Unsigned_64'Asm_Input ("r", Val),
           Volatile => True);
   end Set_CPACR_EL1;

   ------------------
   -- Get_CPTR_EL2 --
   ------------------

   function Get_CPTR_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, cptr_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_CPTR_EL2;

   ------------------
   -- Set_CPTR_EL2 --
   ------------------

   procedure Set_CPTR_EL2 (Val : Unsigned_64) is
   begin
      Asm ("msr cptr_el2, %0",
           Inputs => Unsigned_64'Asm_Input ("r", Val),
           Volatile => True);
   end Set_CPTR_EL2;

   ----------------------
   -- Set_CNTP_CTL_EL0 --
   ----------------------

   procedure Set_CNTP_CTL_EL0 (Val : Unsigned_32) is
   begin
      Asm ("msr cntp_ctl_el0, %0",
           Inputs => Unsigned_32'Asm_Input ("r", Val),
           Volatile => True);
   end Set_CNTP_CTL_EL0;

   ----------------------
   -- Set_CNTP_CTL_EL2 --
   ----------------------

   procedure Set_CNTHP_CTL_EL2 (Val : Unsigned_32) is
   begin
      Asm ("msr cnthp_ctl_el2, %0",
           Inputs => Unsigned_32'Asm_Input ("r", Val),
           Volatile => True);
   end Set_CNTHP_CTL_EL2;

   ----------------------
   -- Set_CNTV_CTL_EL0 --
   ----------------------

   procedure Set_CNTV_CTL_EL0 (Val : Unsigned_32) is
   begin
      Asm ("msr cntv_ctl_el0, %0",
           Inputs => Unsigned_32'Asm_Input ("r", Val),
           Volatile => True);
   end Set_CNTV_CTL_EL0;

   -----------------------
   -- Set_CNTV_TVAL_EL0 --
   -----------------------

   procedure Set_CNTP_TVAL_EL0 (Val : Unsigned_32) is
   begin
      Asm ("msr cntp_tval_el0, %0",
           Inputs => Unsigned_32'Asm_Input ("r", Val),
           Volatile => True);
   end Set_CNTP_TVAL_EL0;

   -----------------------
   -- Set_CNTV_TVAL_EL2 --
   -----------------------

   procedure Set_CNTHP_TVAL_EL2 (Val : Unsigned_32) is
   begin
      Asm ("msr cnthp_tval_el2, %0",
           Inputs => Unsigned_32'Asm_Input ("r", Val),
           Volatile => True);
   end Set_CNTHP_TVAL_EL2;

   --------------------
   -- Get_CNTPCT_EL0 --
   --------------------

   function Get_CNTPCT_EL0 return Unsigned_64 is
      Res : Unsigned_64;
   begin
      --  Read CNTPCT
      Asm ("mrs %0, cntpct_el0",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_CNTPCT_EL0;

   -------------
   -- DC_CVAU --
   -------------

   procedure DC_CVAU (Addr : Address) is
   begin
      Asm ("dc cvau, %0",
           Inputs => Address'Asm_Input ("r", Addr),
           Volatile => True);
   end DC_CVAU;

   -------------
   -- IC_IVAU --
   -------------

   procedure IC_IVAU (Addr : Address) is
   begin
      Asm ("ic ivau, %0",
           Inputs => Address'Asm_Input ("r", Addr),
           Volatile => True);
   end IC_IVAU;

   -------------
   -- DSB_ISH --
   -------------

   procedure DSB_ISH is
   begin
      Asm ("dsb ish", Volatile => True);
   end DSB_ISH;

   ---------
   -- ISB --
   ---------

   procedure ISB is
   begin
      Asm ("isb", Volatile => True);
   end ISB;

   --------------------
   -- Get_Current_EL --
   --------------------

   function Get_Current_EL return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, currentel",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_Current_EL;

   -----------------
   -- Get_ELR_EL3 --
   -----------------

   function Get_ELR_EL3 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, elr_el3",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_ELR_EL3;

   -----------------
   -- Set_ELR_EL3 --
   -----------------

   procedure Set_ELR_EL3 (V : Unsigned_64) is
   begin
      Asm ("msr elr_el3, %0",
           Inputs => Unsigned_64'Asm_Input ("r", V),
           Volatile => True);
   end Set_ELR_EL3;

   ------------------
   -- Get_SPSR_EL3 --
   ------------------

   function Get_SPSR_EL3 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, spsr_el3",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SPSR_EL3;

   -----------------
   -- Get_ESR_EL3 --
   -----------------

   function Get_ESR_EL3 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, esr_el3",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_ESR_EL3;

   -----------------
   -- Get_FAR_EL3 --
   -----------------

   function Get_FAR_EL3 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, far_el3",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_FAR_EL3;

   -----------------
   -- Get_ELR_EL2 --
   -----------------

   function Get_ELR_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, elr_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_ELR_EL2;

   -----------------
   -- Set_ELR_EL2 --
   -----------------

   procedure Set_ELR_EL2 (V : Unsigned_64) is
   begin
      Asm ("msr elr_el2, %0",
           Inputs => Unsigned_64'Asm_Input ("r", V),
           Volatile => True);
   end Set_ELR_EL2;

   ------------------
   -- Get_SPSR_EL2 --
   ------------------

   function Get_SPSR_EL2 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, spsr_el2",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SPSR_EL2;

   -----------------
   -- Get_ESR_EL2 --
   -----------------

   function Get_ESR_EL2 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, esr_el2",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_ESR_EL2;

   -----------------
   -- Get_FAR_EL2 --
   -----------------

   function Get_FAR_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, far_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_FAR_EL2;

   -------------------
   -- Get_HPFAR_EL2 --
   -------------------

   function Get_HPFAR_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, hpfar_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_HPFAR_EL2;

   ------------------
   -- Get_VTCR_EL2 --
   ------------------

   function Get_VTCR_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, vtcr_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_VTCR_EL2;

   -------------------
   -- Get_VTTBR_EL2 --
   -------------------

   function Get_VTTBR_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, vttbr_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_VTTBR_EL2;

   -----------------
   -- Get_HCR_EL2 --
   -----------------

   function Get_HCR_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, hcr_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_HCR_EL2;

   ----------------
   -- Get_SP_EL2 --
   ----------------

   function Get_SP_EL2 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, sp_el2",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SP_EL2;

   -------------------
   -- Get_SCTLR_EL2 --
   -------------------

   function Get_SCTLR_EL2 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, sctlr_el2",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SCTLR_EL2;

   -----------------
   -- Get_ELR_EL1 --
   -----------------

   function Get_ELR_EL1 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, elr_el1",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_ELR_EL1;

   -----------------
   -- Set_ELR_EL1 --
   -----------------

   procedure Set_ELR_EL1 (V : Unsigned_64) is
   begin
      Asm ("msr elr_el1, %0",
           Inputs => Unsigned_64'Asm_Input ("r", V),
           Volatile => True);
   end Set_ELR_EL1;

   ------------------
   -- Get_SPSR_EL1 --
   ------------------

   function Get_SPSR_EL1 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, spsr_el1",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SPSR_EL1;

   ------------------
   -- Get_VBAR_EL1 --
   ------------------

   function Get_VBAR_EL1 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, vbar_el1",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_VBAR_EL1;

   -----------------
   -- Get_ESR_EL1 --
   -----------------

   function Get_ESR_EL1 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, esr_el1",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_ESR_EL1;

   -----------------
   -- Get_FAR_EL1 --
   -----------------

   function Get_FAR_EL1 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, far_el1",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_FAR_EL1;

   ----------------
   -- Get_SP_EL1 --
   ----------------

   function Get_SP_EL1 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, sp_el1",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SP_EL1;

   -------------------
   -- Get_SCTLR_EL1 --
   -------------------

   function Get_SCTLR_EL1 return Unsigned_32
   is
      Res : Unsigned_32;
   begin
      Asm ("mrs %0, sctlr_el1",
           Outputs => Unsigned_32'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SCTLR_EL1;

   -----------------
   -- Get_TCR_EL1 --
   -----------------

   function Get_TCR_EL1 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, tcr_el1",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_TCR_EL1;

   ----------------
   -- Get_SP_EL0 --
   ----------------

   function Get_SP_EL0 return Unsigned_64
   is
      Res : Unsigned_64;
   begin
      Asm ("mrs %0, sp_el0",
           Outputs => Unsigned_64'Asm_Output ("=r", Res),
           Volatile => True);
      return Res;
   end Get_SP_EL0;

end Interfaces.AArch64;