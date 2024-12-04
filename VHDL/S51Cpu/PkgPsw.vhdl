
Library IEEE;
 use IEEE.std_logic_1164.all;

package PkgPsw is

 constant PswRegSize	: integer := 8;

 constant CY		: integer := 7;
 constant AC		: integer := 6;
 constant F0		: integer := 5;
 constant RS1		: integer := 4;
 constant RS0		: integer := 3;
 constant OV		: integer := 2;
 constant F1		: integer := 1;
 constant P		: integer := 0;

 
 procedure PswClr (signal VClrEn: out std_logic_vector(7 downto 0); constant bitnum: integer);
 procedure PswSet (signal VSetEn: out std_logic_vector(7 downto 0); constant bitnum: integer);
 procedure RstVEn (signal VEn: out std_logic_vector(7 downto 0));
 procedure SetPswTo (signal VClrEn: out std_logic_vector(7 downto 0);signal VSetEn: out std_logic_vector(7 downto 0);signal test : in std_logic; constant bitnum: integer);
-- procedure AddPswDriver	(signal VClrEn: out std_logic_vector(7 downto 0);signal VSetEn: out std_logic_vector(7 downto 0);signal testcarry : in std_logic;signal testauxcarry : in std_logic;signal testoverflow : in std_logic);

end PkgPsw;

package body PkgPsw is

 procedure PswClr 	( 
			  signal VClrEn: out std_logic_vector(7 downto 0);
 		 	  constant bitnum: integer
			) is
 begin
  VClrEn(bitnum) <= '1';
 end PswClr;

 procedure PswSet 	( 
			  signal VSetEn: out std_logic_vector(7 downto 0);
 		 	  constant bitnum: integer
			) is
 begin
  VSetEn(bitnum) <= '1';
 end PswSet;
 
 procedure RstVEn (signal VEn: out std_logic_vector(7 downto 0)) is
 begin
  VEn <= (others => '0');
 end RstVEn;


 procedure SetPswTo   (
                        signal VClrEn: out std_logic_vector(7 downto 0);
                        signal VSetEn: out std_logic_vector(7 downto 0);
                        signal test : in std_logic;
                        constant bitnum: integer
                      ) is
 begin
  if (test = '1') then        -- If carry, set carry otherwise clear   
   PswSet(VSetEn, bitnum);
  else
   PswClr(VClrEn, bitnum);    
  end if;  
 end SetPswTo;
 
-- Below procedure does not elaborate correctly with RTL Compiler
--
-- procedure AddPswDriver	(
-- 				  signal VClrEn: out std_logic_vector(7 downto 0);
--				  signal VSetEn: out std_logic_vector(7 downto 0);
--				  signal testcarry : in std_logic;
--				  signal testauxcarry : in std_logic;
--				  signal testoverflow : in std_logic				  
-- 			) is
-- begin
--   SetPswTo(VClrEn, VSetEn, testcarry, CY);		-- drive Carry 
--   SetPswTo(VClrEn, VSetEn, testauxcarry, AC);   	-- drive Aux Carry if 
--   SetPswTo(VClrEn, VSetEn, testoverflow, OV);		-- drive OV    				
-- end AddPswDriver;
     
end;

