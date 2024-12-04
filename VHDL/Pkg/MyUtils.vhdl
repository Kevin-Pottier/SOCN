Library IEEE;
 Use IEEE.std_logic_1164.all;
 Use IEEE.std_logic_arith.all;
    -- synopsys synthesis_off
 Use IEEE.std_logic_textio.all;
Library STD;
 Use STD.textio.all;
    -- synopsys synthesis_on

Package MyUtils is

 Function usize(Nb: natural) return natural;
 Function Xor_Reduce  (Arg: Std_logic_vector) Return Std_logic;	-- from PkgUtils
 Function or_reduce  (Arg: Std_logic_vector) Return Std_logic;	-- from PkgUtils
 Function bool2_stdlogic  (Arg: boolean) Return Std_logic;
 Function stdlogic2_bool  (Arg: std_logic) Return boolean;
 Function scalarprod(op1: std_logic_vector; op2: std_logic) Return std_logic_vector;
 function scalarprod2(op1: std_logic_vector; op2: boolean) return std_logic_vector;
 function GenNullVector(op : integer) return std_logic_vector;

 -- synopsys synthesis_off
 Function To_String(i : Integer) Return String;			-- from PkgUtils
 -- synopsys synthesis_on
  
End MyUtils;

Package body MyUtils is

 Function usize(Nb : natural) Return natural is
   Variable A      : natural;
   Variable Size   : Natural;
 Begin
   A      := Nb-1;
   Size   := 0;
   If (A < 1) Then Return 0; end if;
   for i in 0 to 31 loop
     A    := A / 2;
     Size := Size + 1;
     exit when A = 0;
   end loop;
   Return Size;
 End usize;

 Function Xor_Reduce  (Arg: Std_logic_vector) Return Std_logic is-- from PkgUtils
-- ambit synthesis BUILTIN_XOR_REDUCE
  Variable Result: Std_logic; 
 begin 
  Result := '0';  
  for i in Arg'range loop  
   Result := Result xor Arg(i); 
  end loop; 
  return Result;
 End Xor_Reduce;

 Function or_reduce  (Arg: Std_logic_vector) Return Std_logic is-- from PkgUtils
-- ambit synthesis BUILTIN_OR_REDUCE
  Variable Result: Std_logic; 
 begin 
  Result := '0';  
  for i in Arg'range loop  
   Result := Result or Arg(i); 
  end loop; 
  return Result;
 End or_reduce;

 Function bool2_stdlogic (Arg: boolean) Return Std_logic is
-- ambit synthesis BUILTIN_TYPE_CONVERSION
  Variable Result: Std_logic; 
 begin 
  if Arg then
   Result := '1';
  else
   Result := '0';
  end if;
  return Result;
 End bool2_stdlogic;

 Function stdlogic2_bool (Arg: std_logic) Return boolean is
-- ambit synthesis BUILTIN_TYPE_CONVERSION
  Variable Result: boolean; 
 begin 
  if Arg = '1' then
   Result := true;
  else
   Result := false;
  end if;
  return Result;
 End stdlogic2_bool;

 function scalarprod (op1: std_logic_vector; op2: std_logic) return std_logic_vector is
  variable result: std_logic_vector(op1'range); 
 begin 
  for i in op1'range loop  
   result(i) := op1(i) and op2;
  end loop; 
  return result;
 end scalarprod;
 
 function scalarprod2 (op1: std_logic_vector; op2: boolean) return std_logic_vector is
  variable result: std_logic_vector(op1'range);
  variable op2t: std_logic;
 begin 
  for i in op1'range loop  
   if op2 then
    op2t := '1';
   else
    op2t := '0';
   end if;
   result(i) := op1(i) and op2t;
  end loop; 
  return result;
 end scalarprod2;

 -- synopsys synthesis_off
 Function To_String(i : Integer) Return String is
  Variable l : Line ;
  Variable s : String(1 to 80);
  Variable r : Natural;
 Begin
  Write(l, i) ;
  r := l'length;
  Read(l,s(1 to r));
  Deallocate(l);
  Return s(1 to r) ;
 End To_String  ;
 -- synopsys synthesis_on

 function max(L, R: INTEGER) return INTEGER is
 begin
     if L > R then
	 return L;
     else
	 return R;
     end if;
 end;

 function GenNullVector(op : integer) return std_logic_vector is
  variable result: std_logic_vector(max(op - 1, 0) downto 0) := (others => '0'); 
 begin
  return result;
 end GenNullVector;

end MyUtils;
