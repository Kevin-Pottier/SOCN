Library IEEE;
 Use IEEE.std_logic_1164.all;
 Use IEEE.std_logic_arith.all;
    -- synopsys synthesis_off
 Use IEEE.std_logic_textio.all;
Library STD;
 Use STD.textio.all;
    -- synopsys synthesis_on

Package Utils is

 Subtype Small_Int is Integer range 0 to 1;

 Function "+" (L: Std_logic_vector; R: Std_logic_vector) Return Std_logic_vector;
 Function "+" (L: Std_logic_vector; R: Integer)          Return Std_logic_vector;
 Function "+" (L: Integer;          R: Std_logic_vector) Return Std_logic_vector;
 Function "+" (L: Std_logic_vector; R: Std_ulogic)       Return Std_logic_vector;
 Function "+" (L: Std_ulogic;       R: Std_logic_vector) Return Std_logic_vector;

 Function "-" (L: Std_logic_vector; R: Std_logic_vector) Return Std_logic_vector;
 Function "-" (L: Std_logic_vector; R: Integer)          Return Std_logic_vector;
 Function "-" (L: Integer;          R: Std_logic_vector) Return Std_logic_vector;
 Function "-" (L: Std_logic_vector; R: Std_ulogic)       Return Std_logic_vector;
 Function "-" (L: Std_ulogic;       R: Std_logic_vector) Return Std_logic_vector;

 Function "*" (L: Std_logic_vector; R: Std_logic_vector) Return Std_logic_vector;

 Function "<" (L: Std_logic_vector; R: Std_logic_vector) Return Boolean;
 Function "<" (L: Std_logic_vector; R: Integer)          Return Boolean;
 Function "<" (L: Integer;          R: Std_logic_vector) Return Boolean;

 Function "<="(L: Std_logic_vector; R: Std_logic_vector) Return Boolean;
 Function "<="(L: Std_logic_vector; R: Integer)          Return Boolean;
 Function "<="(L: Integer;          R: Std_logic_vector) Return Boolean;

 Function ">" (L: Std_logic_vector; R: Std_logic_vector) Return Boolean;
 Function ">" (L: Std_logic_vector; R: Integer)          Return Boolean;
 Function ">" (L: Integer;          R: Std_logic_vector) Return Boolean;
 
 Function ">="(L: Std_logic_vector; R: Std_logic_vector) Return Boolean;
 Function ">="(L: Std_logic_vector; R: Integer)          Return Boolean;
 Function ">="(L: Integer;          R: Std_logic_vector) Return Boolean;

 Function "=" (L: Std_logic_vector; R: Std_logic_vector) Return Boolean;
 Function "=" (L: Std_logic_vector; R: Integer)          Return Boolean;
 Function "=" (L: Integer;          R: Std_logic_vector) Return Boolean;

 Function "/="(L: Std_logic_vector; R: Std_logic_vector) Return Boolean;
 Function "/="(L: Std_logic_vector; R: Integer)          Return Boolean;
 Function "/="(L: Integer;          R: Std_logic_vector) Return Boolean;

 Function Shl(Val: Std_logic_vector; Factor: Integer) Return Std_logic_vector;
 Function Shr(Val: Std_logic_vector; Factor: Integer) Return Std_logic_vector;

 Function To_Integer(Arg: Integer)          Return Integer;
 Function To_Integer(Arg: Std_logic_vector) Return Integer;
 Function To_Integer(Arg: Std_ulogic)       Return Small_Int;

 Function To_Std_logic_vector(Arg: Integer;    Size: Integer) Return Std_logic_vector;
 Function To_Std_logic_vector(Arg: Std_ulogic; Size: Integer) Return Std_logic_vector;

 Function To_Resolved   (V : Std_ulogic_vector) Return Std_logic_vector;
 Function To_Unresolved (V : Std_logic_vector)  Return Std_ulogic_vector;

 Function And_Reduce  (Arg: Std_logic_vector) Return Std_logic;
 Function Nand_Reduce (Arg: Std_logic_vector) Return Std_logic;
 Function Or_Reduce   (Arg: Std_logic_vector) Return Std_logic;
 Function Nor_Reduce  (Arg: Std_logic_vector) Return Std_logic;
 Function Xor_Reduce  (Arg: Std_logic_vector) Return Std_logic;
 Function Xnor_Reduce (Arg: Std_logic_vector) Return Std_logic;

 -------------------------------
 -- No Synthesizable Function --
 -------------------------------
 -- synopsys synthesis_off

 Function Hex (Data : String; Length : Natural := 0) Return Std_logic_vector; 
 -- Generated bits are Strong

 ---------------------------------------------------------------------
 -- USIZE :                                                         --
 -- Returns the minimum number of bits, necessary for coding SOURCE --
 -- (resp. the integer part of SOURCE, when source is real).        --
 ---------------------------------------------------------------------
 
 Function Usize(SOURCE: Integer) Return Natural;

 --- Convert to string
 Function To_String  (I  : Integer)          Return String ;
 Function To_String  (R  : Real)             Return String ;
 Function To_String  (B  : Boolean)          Return String ;
 Function To_String  (T  : Time)             Return String ;
 Function To_String  (B  : Std_logic)        Return String ;
 Function To_String  (B  : Std_logic_Vector) Return String ;
 Function To_HString (B  : Std_logic_Vector) Return String ;

 Function To_Integer          (S : String) Return Integer ;
 Function To_real             (S : String) Return Real ;
 Function To_Boolean          (S : String) Return Boolean ;
 Function To_Time             (S : String) Return Time ;
 Function To_Std_logic        (S : String) Return Std_logic ;
 Function To_Std_logic_vector (S : String) Return Std_logic_Vector ;

 Procedure Print (T : Time; S : String);
 Procedure Print (S : String);

 ---------------------------------------------------------------
 -- CHECK_SETUP Procedure (Std_logic relatively to Std_logic) --
 ---------------------------------------------------------------
 Procedure CHECK_SETUP
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_logic;                          -- Checked Signal
          T_SETUP   : In Time           := 0 ns;             -- Setup time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Setup description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High);       -- End of Check

 ----------------------------------------------------------------------
 -- CHECK_SETUP Procedure (Std_Logic_Vector relatively to Std_logic) --
 ----------------------------------------------------------------------
 Procedure CHECK_SETUP
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_Logic_Vector;                   -- Checked Signal
          T_SETUP   : In Time           := 0 ns;             -- Setup time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Setup description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High);       -- End of Check

 --------------------------------------------------------------
 -- CHECK_HOLD Procedure (Std_logic relatively to Std_logic) --
 --------------------------------------------------------------
 Procedure CHECK_HOLD
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_logic;                          -- Checked Signal
          T_HOLD    : In Time           := 0 ns;             -- Hold time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Hold description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High);       -- End of Check

 ---------------------------------------------------------------------
 -- CHECK_HOLD Procedure (Std_Logic_Vector relatively to Std_logic) --
 ---------------------------------------------------------------------
 Procedure CHECK_HOLD
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_Logic_Vector;                   -- Checked Signal
          T_HOLD    : In Time           := 0 ns;             -- Hold time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Hold description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High);       -- End of Check

 ---------------------------------------
 -- CHECK_PULSE Procedure (Std_logic) --
 ---------------------------------------
 Procedure CHECK_PULSE
  (Signal S        : In Std_logic;                          -- Signal activating check
          STATE    : In Std_logic;                          -- Checked level
          DURATION : In Time           := 0 ns;             -- Min or max level duration
          MINIMUM  : In Boolean        := True;             -- Choose min or max check
          SEVERE   : In Severity_Level := Warning;          -- Message severity level
          MESS1    : In String         := "<missing name>"; -- Instance name for message edition
          MESS2    : In String         := "";               -- Hold description for message edition
          H0        : In Time           := 0 ns;            -- Start checking
          H1        : In Time           := Time'High);      -- End of Check

 -- synopsys synthesis_on
End Utils;

Package body Utils is
-----
 Function "+" (L: Std_logic_vector; R: Std_logic_vector) Return Std_logic_vector is
 begin
   Return Unsigned(L) + Unsigned(R);
 End;
-----
 Function "+" (L: Std_logic_vector; R: Integer) Return Std_logic_vector is
 begin
   Return Unsigned(L) + R;
 End;
-----
 Function "+" (L: Integer; R: Std_logic_vector) Return Std_logic_vector is
 begin 
   Return L + Unsigned(R); 
 End;
----- 
 Function "+" (L: Std_logic_vector; R: STD_ULOGIC) Return Std_logic_vector is
 begin  
   Return Unsigned(L) + R;  
 End;
-----
 Function "+" (L: STD_ULOGIC; R: Std_logic_vector) Return Std_logic_vector is
 begin  
   Return L + Unsigned(R);  
 End;
-----
 Function "-" (L: Std_logic_vector; R: Std_logic_vector) Return Std_logic_vector is
 begin  
   Return Unsigned(L) - Unsigned(R);  
 End;
-----
 Function "-" (L: Std_logic_vector; R: Integer) Return Std_logic_vector is
 begin   
   Return Unsigned(L) - R;   
 End;
-----
 Function "-" (L: Integer; R: Std_logic_vector) Return Std_logic_vector is
 begin   
   Return L - Unsigned(R);   
 End;
-----
 Function "-" (L: Std_logic_vector; R: STD_ULOGIC) Return Std_logic_vector is
 begin   
   Return Unsigned(L) - R;   
 End;
-----
 Function "-" (L: STD_ULOGIC; R: Std_logic_vector) Return Std_logic_vector is
 begin   
   Return L - Unsigned(R);   
 End;
-----
 Function "*" (L: Std_logic_vector; R: Std_logic_vector) Return Std_logic_vector is
 begin  
   Return Unsigned(L) * Unsigned(R);
 End;
-----
 Function "<" (L: Std_logic_vector; R: Std_logic_vector) Return Boolean is
 begin   
   Return Unsigned(L) < Unsigned(R); 
 End;
-----
 Function "<" (L: Std_logic_vector; R: Integer) Return Boolean is
 begin    
   Return Unsigned(L) < R;  
 End; 
-----
 Function "<" (L: Integer; R: Std_logic_vector) Return Boolean is
 begin    
   Return L < Unsigned(R);  
 End; 
-----
 Function "<="(L: Std_logic_vector; R: Std_logic_vector) Return Boolean is
 begin   
   Return Unsigned(L) <= Unsigned(R); 
 End;
-----
 Function "<="(L: Std_logic_vector; R: Integer) Return Boolean is
 begin   
   Return Unsigned(L) <= R; 
 End;
-----
 Function "<="(L: Integer; R: Std_logic_vector) Return Boolean is
 begin   
   Return L <= Unsigned(R); 
 End;
-----
 Function ">" (L: Std_logic_vector; R: Std_logic_vector) Return Boolean is
 begin   
   Return Unsigned(L) > Unsigned(R); 
 End;
-----
 Function ">" (L: Std_logic_vector; R: Integer) Return Boolean is
 begin   
   Return Unsigned(L) > R; 
 End;
-----
 Function ">" (L: Integer; R: Std_logic_vector) Return Boolean is
 begin   
   Return L > Unsigned(R); 
 End;
-----
 Function ">="(L: Std_logic_vector; R: Std_logic_vector) Return Boolean is
 begin   
   Return Unsigned(L) >= Unsigned(R); 
 End;
-----
 Function ">="(L: Std_logic_vector; R: Integer) Return Boolean is
 begin   
   Return Unsigned(L) >= R; 
 End;
-----
 Function ">="(L: Integer; R: Std_logic_vector) Return Boolean is
 begin   
   Return L >= Unsigned(R); 
 End;
-----
 Function "=" (L: Std_logic_vector; R: Std_logic_vector) Return Boolean is
 begin   
   Return Unsigned(L) = Unsigned(R); 
 End;
-----
 Function "=" (L: Std_logic_vector; R: Integer) Return Boolean is
 begin   
   Return Unsigned(L) = R; 
 End;
-----
 Function "=" (L: Integer; R: Std_logic_vector) Return Boolean is
 begin   
   Return L = Unsigned(R); 
 End;
-----
 Function "/="(L: Std_logic_vector; R: Std_logic_vector) Return Boolean is
 begin   
   Return Unsigned(L) /= Unsigned(R); 
 End;
-----
 Function "/="(L: Std_logic_vector; R: Integer) Return Boolean is
 begin   
   Return Unsigned(L) /= R; 
 End;
-----
 Function "/="(L: Integer; R: Std_logic_vector) Return Boolean is
 begin   
   Return L /= Unsigned(R); 
 End;
-----
 Function Shl(Val: Std_logic_vector; Factor: Integer) Return Std_logic_vector is
   Variable Res : Std_logic_vector(Val'range) := Val;
 begin
   if (Factor <= 0) then
     Return Res;
   end if;
   if (Factor >= (Res'high - Res'low)) then
     for i in Val'high to Val'low loop
        Res(i) := '0';
     end loop;
     Return Res;
   end if;
   for i in Val'high downto Val'low+Factor loop
      Res(i) := Res(i-Factor);
   end loop;
   for i in Val'low+Factor-1 downto Val'low loop
      Res(i) := '0';
   end loop;
   Return Res;
 End;
-----
 Function Shr(Val: Std_logic_vector; Factor: Integer) Return Std_logic_vector is
   Variable Res : Std_logic_vector(Val'range) := Val;
 begin
   if (Factor <= 0) then
     Return Res;
   end if;
   if (Factor >= (Res'high - Res'low)) then
     for i in Val'high to Val'low loop
        Res(i) := '0';
     end loop;
     Return Res;
   end if;
   for i in Val'low to Val'high-Factor loop
      Res(i) := Res(i+Factor);
   end loop;
   for i in Val'high-Factor+1 to Val'high loop
      Res(i) := '0';
   End loop;
   Return Res;
 End;
-----
 Function To_Integer(Arg: Integer) Return Integer is
 begin 
   Return Conv_Integer(Arg);
 End;
-----
 Function To_Integer(Arg: Std_logic_vector) Return Integer is
 begin 
   Return Conv_Integer( Unsigned(Arg));
 End;
-----
 Function To_Integer(Arg: Std_ulogic) Return Small_Int is
 begin 
   Return Conv_Integer(Arg);
 End;
-----
 Function To_Std_logic_vector(Arg: Integer; Size: Integer) Return Std_logic_vector is
 begin
   Return Conv_Std_logic_vector(Arg, Size);
 End;
-----
 Function To_Std_logic_vector(Arg: Std_ulogic; Size: Integer) Return Std_logic_vector is
 begin
   Return Conv_Std_logic_vector(Arg, Size);
 End;
-----
-----------------------------------------------------------------------
-- TO_RESOLVED : Converts the 9-valued unresolved vector V into a    --
--   resolved one.                                                   --
-----------------------------------------------------------------------
 
 Function To_resolved (V : Std_ulogic_vector)  Return Std_logic_vector is
   Variable Result : Std_logic_vector(V'range);
 begin
   for I in V'range loop
     if    V(I) = 'U' then Result(I) := 'U';
     elsif V(I) = 'X' then Result(I) := 'X';
     elsif V(I) = '0' then Result(I) := '0';
     elsif V(I) = '1' then Result(I) := '1';
     elsif V(I) = 'Z' then Result(I) := 'Z';
     elsif V(I) = 'W' then Result(I) := 'W';
     elsif V(I) = 'L' then Result(I) := 'L';
     elsif V(I) = 'H' then Result(I) := 'H';
     else                  Result(I) := '-';
     end if;
   end loop;
   Return Result;
 End To_resolved;

-----------------------------------------------------------------------
-- TO_UNRESOLVED : Converts the 9-valued resolved vector V into an   --
--   unresolved one.                                                 --
-----------------------------------------------------------------------
 
 Function To_unresolved (V : Std_logic_vector)  Return Std_ulogic_vector is
   Variable Result : Std_ulogic_vector(V'range);
 begin
   for I in V'range loop
     if    V(I) = 'U' then Result(I) := 'U';
     elsif V(I) = 'X' then ResulT(I) := 'X';
     elsif V(I) = '0' then Result(I) := '0';
     elsif V(I) = '1' then Result(I) := '1';
     elsif V(I) = 'Z' then Result(I) := 'Z';
     elsif V(I) = 'W' then Result(I) := 'W';
     elsif V(I) = 'L' then Result(I) := 'L';
     elsif V(I) = 'H' then Result(I) := 'H';
     else                  Result(I) := '-';
     end if;
   end loop;
   Return Result;
 End To_unresolved;

 Function And_Reduce  (Arg: Std_logic_vector) Return Std_logic is
  Variable Result: Std_logic;
 begin
  Result := '1';
  for i in Arg'range loop
   Result := Result and Arg(i);
  end loop;
  return Result;
 End And_Reduce;

 Function Nand_Reduce (Arg: Std_logic_vector) Return Std_logic is
  Variable Result: Std_logic;
 begin
  Result := Not(And_Reduce(Arg));
  return Result;
 End Nand_Reduce;

 Function Or_Reduce   (Arg: Std_logic_vector) Return Std_logic is
  Variable Result: Std_logic;
 begin 
  Result := '0'; 
  for i in Arg'range loop 
   Result := Result or Arg(i);
  end loop; 
  return Result;
 End Or_Reduce;

 Function Nor_Reduce  (Arg: Std_logic_vector) Return Std_logic is 
  Variable Result: Std_logic; 
 begin 
  Result := Not(Or_Reduce(Arg)); 
  return Result;
 End Nor_Reduce;

 Function Xor_Reduce  (Arg: Std_logic_vector) Return Std_logic is
  Variable Result: Std_logic; 
 begin 
  Result := '0';  
  for i in Arg'range loop  
   Result := Result xor Arg(i); 
  end loop; 
  return Result;
 End Xor_Reduce;

 Function Xnor_Reduce (Arg: Std_logic_vector) Return Std_logic is
  Variable Result: Std_logic;  
 begin 
  Result := Not(Xor_Reduce(Arg));  
  return Result;
 End Xnor_Reduce;

 -------------------------------
 -- No Synthesizable Function --
 -------------------------------
 -- synopsys synthesis_off

 -----------------------------------------------
 -- Subtypes Definitions
 -----------------------------------------------

 Subtype Vec4 is Std_ulogic_vector (3 DownTo 0); -- 4-bit not resolved bus

 -----------------------------------------------
 -- V9_INT2VEC4 : integer to VEC4 conversions
 -----------------------------------------------
   
 Function V9_int2vec4 (Data : Integer) Return Vec4 is
  Variable ResulT : Vec4 ;
  Variable Idata  : Integer := Data;
  Variable Imod   : Integer := 0;
 begin
  for i in Result'reverse_range loop
    Imod  := Idata rem 2 ;
    Idata := Idata / 2 ;
    if (Imod=1) then  Result(i):='1' ;
                else  Result(i):='0' ;
    end if ;
  end loop ;
  Return Result ;
 end V9_int2vec4 ;
   
 ----------------------------------------------------------------------
 --                  HEX : Hexadecimal Format Handling               --
 ----------------------------------------------------------------------
 
 Function Hex (Data : String; Length : natural := 0) Return Std_logic_vector Is
  Constant Data1 : String (1 to Data'length) := Data;
  Constant Msb : Natural := Data'Length * 4 - 1;
  Variable Result : Std_logic_vector (Msb DownTo 0) := (others => 'X');
  Constant All_X : Std_logic_vector (Msb DownTo 0) := (others => 'X');
  Variable Char_pos   : Integer;
  Variable Slice_high : Integer := Result'high + 4;
  Variable Slice_low  : Integer := Result'high + 1;
  constant RX         : Std_logic_vector (3 downto 0) := "XXXX";
  constant RZ         : Std_logic_vector (3 downto 0) := "ZZZZ";
  constant RM         : Std_logic_vector (3 downto 0) := "----";
  constant RU         : Std_logic_vector (3 downto 0) := "UUUU";
  variable Wrong      : Boolean;

 Begin
  For i In Data1'Range Loop
    If    Data1(i) = 'X' Then Result(Slice_high - 4*i Downto Slice_low - 4*i) := RX;
    Elsif Data1(i) = 'Z' Then Result(Slice_high - 4*i Downto Slice_low - 4*i) := RZ;
    Elsif Data1(i) = '-' Then Result(Slice_high - 4*i Downto Slice_low - 4*i) := RM;
    Elsif Data1(i) = 'U' Then Result(Slice_high - 4*i Downto Slice_low - 4*i) := RU;
     
    Elsif (Data1(i) >= '0') and (Data1(i) <= '9') Then 
      Char_pos := character'pos(Data1(i));
      Result(Slice_high - 4*i Downto Slice_low - 4*i) := To_resolved(V9_int2vec4(Char_pos-48));
    Elsif (Data1(i) >= 'A') and (Data1(i) <= 'F') Then 
      Char_pos := character'pos(Data1(i));
      Result(Slice_high - 4*i Downto Slice_low - 4*i) := To_resolved(V9_int2vec4(Char_pos-55));
    Else
      assert false report "Wrong hexadecimal string " severity warning;
      Result := All_X;
      Wrong := true;
      exit;
    End if;
  End Loop;
  if (Length = 0) or (Length = Msb + 1) then
    Return Result;
  elsif Length <= Msb then
      Return Result ((Length-1) downto 0);
  else Return ((Length - 1) downto (Msb + 1) => '0') & Result;
  end if;
 End Hex;
 
                            ----oOo----
 
 ---------------------------------------------------------------------
 -- USIZE :                                                         --
 -- Returns the minimum number of bits, necessary for coding SOURCE --
 -- (resp. the integer part of SOURCE, when source is real).        --
 ---------------------------------------------------------------------

 Function Usize(Source: Integer) Return Natural is
   Variable A    : Integer := Source;
   Variable Size : Natural := 0;
 Begin
   If (Source = 0) Then Return 1 ;
                   Else While (A /= 0) Loop
                           A    := A / 2 ;
                           Size := Size + 1;
                        End Loop;
                        Return Size;
   End If;
 End Usize;

 -----------------------
 -- Convert to STRING --
 -----------------------

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
 
 Function To_String(r : Real) Return String is
  Variable l : Line ;
  Variable s : String(1 to 80);
  Variable rr: Natural;
 Begin
  Write(l, r) ;
  rr:= l'length;
  Read(l,s(1 to rr));
  Deallocate(l);
  Return s(1 to rr) ;
 End To_String  ;
 
 Function To_String(B : Boolean) Return String is
 Begin
  Case B is
    When False  => Return "FALSE";
    When True   => Return "TRUE";
  End Case;
 End To_String;

 Function To_String(t : Time) Return String Is
  Variable l : Line ;
  Variable s : String(1 to 80);
  Variable r : Natural;
 Begin
  Write(l, t, UNIT => ns) ;
  r := l'length;
  Read(l,s(1 to r));
  Deallocate(l);
  Return s(1 to r) ;
 End To_String  ;
  
 Function To_String(B : Std_logic) Return String is
 Begin
  If    B = 'X' Then Return "X";
  Elsif B = '0' Then Return "0";
  Elsif B = '1' Then Return "1";
  Elsif B = 'Z' Then Return "Z";
  Elsif B = 'W' Then Return "W";
  Elsif B = 'L' Then Return "L";
  Elsif B = 'H' Then Return "H";
  Elsif B = '-' Then Return "-";
  Else               Return "U";
  End If;
 End To_String;
  
 Function To_String(B : Std_logic_Vector) Return String is
  Variable S : String (1 to B'Length);
  Variable Index : Natural := 0;
 Begin
  For K In B'Range Loop
     Index := Index + 1;
     If    B(K) = 'X' Then S(Index) := 'X';
     Elsif B(K) = '0' Then S(Index) := '0';
     Elsif B(K) = '1' Then S(Index) := '1';
     Elsif B(K) = 'Z' Then S(Index) := 'Z';
     Elsif B(K) = 'W' Then S(Index) := 'W';
     Elsif B(K) = 'L' Then S(Index) := 'L';
     Elsif B(K) = 'H' Then S(Index) := 'H';
     Elsif B(K) = '-' Then S(Index) := '-';
     Else                  S(Index) := 'U';
     End If;
  End Loop;
  Return S;
 End To_String;

Function To_HString(B : Std_logic_Vector) Return String is
      variable L : Line;
 begin
      HWRITE(L,B);
      Return L.all;
 end To_HString;

 Function To_Integer(s : String) Return Integer is
   Variable l : Line ;
   Variable i : Integer ;
   Variable ERR : Boolean := FALSE ;
   Variable No_Int_Part : Boolean := TRUE ;
 Begin
   If S'Length = 0 Then
     ERR := TRUE;
   Else
    For K In S'Range Loop
     If ((S(K) = '+') or (S(K) = '-')) Then
       If (K /= S'Left) Then
         ERR := TRUE;
       End If;
     Elsif ((S(K) > '9') or (S(K) < '0')) Then
       ERR := TRUE;
     Else
       No_Int_Part := FALSE;
     End If;
    End Loop;
   End If;
   If ERR or No_Int_Part Then
     assert false report " Argument badly formed for integer" severity warning;
     Return 0;
   End If;
   Write(l,String'(s));
   Read(l,i) ;
   Deallocate(l);
   Return i ;
 End To_Integer ;

 Function To_Real(s : String) Return Real is
   Variable l : Line ;
   Variable r : Real ;
   Variable One_Dot, ERR : Boolean := False;
   Variable No_dec_part, No_Int_Part : Boolean := True;
 Begin
  If S'Length < 3 Then
    ERR := TRUE;
  Else
    For K In S'Range Loop
       If ((S(K) = '+') or (S(K) = '-')) Then
         If (K /= S'Left) Then
           ERR := TRUE;
         End If;
       Elsif (S(K) = '.') Then
         If No_Int_part or One_Dot Then
           ERR := TRUE;
         Else
           One_Dot := TRUE;
         End If;
       Elsif (S(K) >= '0') and (S(K) <= '9') Then
         If One_Dot Then
           No_Dec_Part := FALSE;
         Else
           No_Int_Part := FALSE;
         End If;
       Else
         ERR := TRUE;
       End If;
    End Loop;
  End If;
  If ERR or No_Dec_Part or No_Int_Part Then
    assert false report " Argument badly formed for real " severity warning;
    Return 0.0;
  End If;
  Write(l, String'(s));
  Read(l, r) ;
  Deallocate(l);
  Return r ;
 End To_real;

 Function To_Boolean(s : String) Return Boolean is
   Constant UP : String(1 to S'Length) := (S);
 Begin
  If UP = "TRUE"  Then
    Return True;
  Elsif UP = "FALSE" Then
    Return False;
  Else
    assert false report " Argument should be FALSE or TRUE " severity warning;
    Return False;
  End If;
 End To_Boolean;
  
 Function To_Time(s : String) Return Time is
   Variable l : Line ;
   Variable t : Time ;
   Variable ERR, One_Dot, One_Blank : Boolean := False;
   Variable No_Int_Part, No_Dec_Part : Boolean := True;
   Variable Unit : String(1 to 3) := (Others => ' ');
   Constant S_Low : String(S'Range) := (S);
 Begin
  If S'Length < 3 Then
    ERR := TRUE;
  Else
    For K In S'Range Loop
       If (S(K) = '-') Then
         If (K /= S'Left) Then
           ERR := TRUE;
           Exit;
         End If;
       Elsif (S(K) = '.') Then
         If No_Int_part or One_Dot Then
           ERR := TRUE;
           Exit;
         Else
           One_Dot := TRUE;
         End If;
       Elsif (S(K) >= '0') and (S(K) <= '9') Then
         If One_Dot Then
           No_Dec_Part := FALSE;
         Else
           No_Int_Part := FALSE;
         End If;
       Elsif (S_Low(K) = 'f') or (S_Low(K) = 'p') or (S_Low(K) = 'n') or (S_Low(K) = 'u')
          or (S_Low(K) = 'm') or (S_Low(K) = 's') or (S_Low(K) = 'h') or (S_Low(K) = 'e')
          or (S_Low(K) = 'c') or (S_Low(K) = 'i') or (S_Low(K) = 'n') or (S_Low(K) = 'r')
          or (S_Low(K) = ' ') Then
         If (No_Int_Part) or (One_Dot and No_Dec_Part) Then
           ERR := TRUE;
           Exit;
         Else
           If S_Low(K) = ' ' Then
             If One_Blank = True Then
               ERR := TRUE;
               Exit;
             Else
               One_Blank := TRUE;
             End If;
           Else
             If Unit(3) /= ' ' Then
               ERR := TRUE;
               Exit;
             End If;
             For K2 In 1 to 3 Loop
                If Unit(K2) = ' ' Then
                  Unit(K2) := S_Low(K);
                  Exit;
                End If;
             End Loop;
           End If;
         End If;
       Else
         ERR := TRUE;
         Exit;
       End If;
     End Loop;
     If (Unit /= "fs ") and (Unit /= "ps ") and (Unit /= "ns ") and (Unit /= "us ") and
        (Unit /= "ms ") and (Unit /= "sec") and (Unit /= "min") and (Unit /= "hr ") Then
       ERR := TRUE;
     End If;
   End If;
   If ERR Then
     assert false report " Argument badly formed for time" severity warning;
     Return 0 ns;
   End If;
   Write(l, String'(s));
   Read(l, t) ;
   Deallocate(l);
   Return t ;
 End To_Time  ;

 Function To_Std_logic (S : String) Return Std_logic is
   Variable L : Line ;
   Variable C : Character ;
 Begin
  If (S /= "U") and (S /= "X") and (S /= "0") and (S /= "1") and (S /= "Z") and
     (S /= "W") and (S /= "L") and (S /= "H") and (S /= "-") Then
    assert false report " Argument badly formed for Std_logic" severity warning;
    Return 'X';
  End If;
  Write(L, String'(S));
  Read(L, C) ;
  Deallocate(L);
  If    C = '0' Then Return '0';
  Elsif C = '1' Then Return '1';
  Elsif C = 'Z' Then Return 'Z';
  Elsif C = 'W' Then Return 'W';
  Elsif C = 'L' Then Return 'L';
  Elsif C = 'H' Then Return 'H';
  Elsif C = 'U' Then Return 'U';
  Elsif C = '-' Then Return '-';
  Else               Return 'X';
  End If;
 End To_Std_logic;

 Function To_Std_logic_vector (S : String) Return Std_Logic_Vector is
   Variable L : Line ;
   Variable STR : String (S'Range);
   Variable Result : Std_Logic_Vector (S'Range);
   Constant All_X : Std_Logic_Vector(S'Range) := (Others => 'X');
 Begin
  For K In S'Range Loop
     If (S(K) /= 'U') and (S(K) /= 'X') and (S(K) /= '0') and (S(K) /= '1') and (S(K) /= 'Z') and
        (S(K) /= 'W') and (S(K) /= 'L') and (S(K) /= 'H') and (S(K) /= '-') Then
       assert false report " Argument badly formed for Std_logic_vector" severity warning;
       Return All_X;
     End If;
  End Loop;
  Write(L, String'(S));
  Read(L, STR) ;
  Deallocate(L);
  For K In STR'Range Loop
     If    STR(K) = '0' Then Result(K) := '0';
     Elsif STR(K) = '1' Then Result(K) := '1';
     Elsif STR(K) = 'Z' Then Result(K) := 'Z';
     Elsif STR(K) = 'W' Then Result(K) := 'W';
     Elsif STR(K) = 'L' Then Result(K) := 'L';
     Elsif STR(K) = 'H' Then Result(K) := 'H';
     Elsif STR(K) = 'U' Then Result(K) := 'U';
     Elsif STR(K) = '-' Then Result(K) := '-';
     Else                    Result(K) := 'X';
     End If;
  End Loop;
  Return Result;
 End To_Std_logic_vector;
  
 Procedure Print (T : Time; S : String) is
  Variable tempo : line;
 Begin
  write(tempo, T);
  write(tempo, string'(" "));
  write(tempo, S);
  writeline(output, tempo);
 End Print;
  
 Procedure Print (S : String) is
  Variable tempo : line;
 Begin
  write(tempo, S);
  writeline(output, tempo);
 End Print;

 ---------------------------------------------------------------
 -- CHECK_SETUP Procedure (Std_logic relatively to Std_logic) --
 ---------------------------------------------------------------
 Procedure CHECK_SETUP
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_logic;                          -- Checked Signal
          T_SETUP   : In Time           := 0 ns;             -- Setup time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Setup description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High) is     -- End of Check

  Variable LAST_EVENT : Time := 0 ns;
 Begin
  loop
   wait until CLK= ACT_STATE;
    LAST_EVENT := DIN'Last_Event;
    if T_SETUP < 0 ns then
      print("Negative Setup Time");
      print("Setup check ignored / Simulation interrupted");
      assert false severity Failure;
    end if;
    if (now >= H0 and now <= H1) then
     if (LAST_EVENT < T_SETUP) then
      print("---- SETUP TIME VIOLATION ----"& (1 to 50 => '-'));
      print("-- At Time : "&To_String(now));
      print("--           "&MESS1&" --> "&MESS2);
      print("--           Setup time too short ("&To_String(LAST_EVENT)&" instead of "&To_String(T_SETUP)&")");
      print((1 to 80 => '-'));
      print(" ");
      if (SEVERE = ERROR or SEVERE = FAILURE) then
       assert false severity SEVERE;
      end if;
     end if;
    end if;
  end loop;
 End CHECK_SETUP;

 ----------------------------------------------------------------------
 -- CHECK_SETUP Procedure (Std_Logic_Vector relatively to Std_logic) --
 ----------------------------------------------------------------------
 Procedure CHECK_SETUP
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_Logic_Vector;                   -- Checked Signal
          T_SETUP   : In Time           := 0 ns;             -- Setup time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Setup description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High) is     -- End of Check
 
  Variable LAST_EVENT : Time := 0 ns;
 Begin
  loop
   wait until CLK= ACT_STATE;
    LAST_EVENT := DIN'Last_Event;
    if T_SETUP < 0 ns then
      print("Negative Setup Time");
      print("Setup check ignored / Simulation interrupted");
      assert false severity Failure;
    end if;
    if (now >= H0 and now <= H1) then
     if (LAST_EVENT < T_SETUP) then
      print("---- SETUP TIME VIOLATION ----"& (1 to 50 => '-'));
      print("-- At Time : "&To_String(now));
      print("--           "&MESS1&" --> "&MESS2);
      print("--           Setup time too short ("&To_String(LAST_EVENT)&" instead of "&To_String(T_SETUP)&")");
      print((1 to 80 => '-'));
      print(" ");
      if (SEVERE = ERROR or SEVERE = FAILURE) then
       assert false severity SEVERE;
      end if;
     end if;
    end if;
  end loop;
 End CHECK_SETUP;

 --------------------------------------------------------------
 -- CHECK_HOLD Procedure (Std_logic relatively to Std_logic) --
 --------------------------------------------------------------
 Procedure CHECK_HOLD
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_logic;                          -- Checked Signal
          T_HOLD    : In Time           := 0 ns;             -- Hold time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Hold description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High) is     -- End of Check

  Variable LAST_EVENT : Time := 0 ns;
 Begin
  loop
   wait until CLK= ACT_STATE;
    LAST_EVENT := now;
    if T_HOLD >= 0 ns then
     wait on DIN for T_HOLD;
     LAST_EVENT := now - LAST_EVENT;
    end if;
    if T_HOLD < 0 ns then
      print("Negative Hold Time");
      print("Hold check ignored / Simulation interrupted");
      assert false severity Failure;
    end if;
    if (now - LAST_EVENT >= H0 and now - LAST_EVENT <= H1) then
     if (LAST_EVENT < T_HOLD) then
      print("---- HOLD TIME VIOLATION ----"& (1 to 51 => '-'));
      print("-- At Time : "&To_String(now));
      print("--           "&MESS1&" --> "&MESS2);
      print("--           Hold time too short ("&To_String(LAST_EVENT)&" instead of "&To_String(T_HOLD)&")");
      print((1 to 80 => '-'));
      print(" ");
      if (SEVERE = ERROR or SEVERE = FAILURE) then
       assert false severity SEVERE;
      end if;
     end if;
    end if;
  end loop;
 End CHECK_HOLD;
 
 ---------------------------------------------------------------------
 -- CHECK_HOLD Procedure (Std_Logic_Vector relatively to Std_logic) --
 ---------------------------------------------------------------------
 Procedure CHECK_HOLD
  (Signal CLK       : In Std_logic;                          -- Signal activating check
   Signal DIN       : In Std_Logic_Vector;                   -- Checked Signal
          T_HOLD    : In Time           := 0 ns;             -- Hold time Value
          ACT_STATE : In Std_logic;                          -- State reached by CLK for activating check
          SEVERE    : In Severity_Level := Warning;          -- Message severity level
          MESS1     : In String         := "<missing name>"; -- Instance name for message edition
          MESS2     : In String         := "";               -- Hold description for message edition
          H0        : In Time           := 0 ns;             -- Start checking
          H1        : In Time           := Time'High) is     -- End of Check

  Variable LAST_EVENT : Time := 0 ns;
 Begin
  loop
   wait until CLK= ACT_STATE;
    LAST_EVENT := now;
    if T_HOLD >= 0 ns then
     wait on DIN for T_HOLD;
     LAST_EVENT := now - LAST_EVENT;
    end if;
    if T_HOLD < 0 ns then
      print("Negative Hold Time"); 
      print("Hold check ignored / Simulation interrupted"); 
      assert false severity Failure; 
    end if;
    if (now - LAST_EVENT >= H0 and now - LAST_EVENT <= H1) then
     if (LAST_EVENT < T_HOLD) then
      print("---- HOLD TIME VIOLATION ----"& (1 to 51 => '-'));
      print("-- At Time : "&To_String(now));
      print("--           "&MESS1&" --> "&MESS2);
      print("--           Hold time too short ("&To_String(LAST_EVENT)&" instead of "&To_String(T_HOLD)&")");
      print((1 to 80 => '-'));
      print(" ");
      if (SEVERE = ERROR or SEVERE = FAILURE) then
       assert false severity SEVERE;
      end if;
     end if;
    end if;
  end loop;
 End CHECK_HOLD;

 ---------------------------------------
 -- CHECK_PULSE Procedure (Std_logic) --
 ---------------------------------------
 Procedure CHECK_PULSE
  (Signal S        : In Std_logic;                          -- Signal activating check
          STATE    : In Std_logic;                          -- Checked level
          DURATION : In Time           := 0 ns;             -- Min or max level duration
          MINIMUM  : In Boolean        := True;             -- Choose min or max check
          SEVERE   : In Severity_Level := Warning;          -- Message severity level
          MESS1    : In String         := "<missing name>"; -- Instance name for message edition
          MESS2    : In String         := "";               -- Hold description for message edition
          H0        : In Time           := 0 ns;            -- Start checking
          H1        : In Time           := Time'High) is    -- End of Check

  Variable WIDTH : Time := 0 ns;
 Begin
  loop
   wait until S= STATE;
    WIDTH := now;
   wait until not(S= STATE);
    WIDTH := now - WIDTH;
    if (now - WIDTH >= H0 and now <= H1) then
     if MINIMUM and (WIDTH < DURATION) then
      print("---- PULSE WIDTH VIOLATION ----"& (1 to 49 => '-'));
      print("-- At Time : "&To_String(now));
      print("--           "&MESS1&" --> "&MESS2);
      print("--           Pulse width too short ("&To_String(WIDTH)&" instead of "&To_String(DURATION)&")");
      print((1 to 80 => '-'));
      print(" ");
      if (SEVERE = ERROR or SEVERE = FAILURE) then
       assert false severity SEVERE;
      end if;
     elsif (not MINIMUM) and (WIDTH > DURATION) then
      print("---- PULSE WIDTH VIOLATION ----"& (1 to 49 => '-'));
      print("-- At Time : "&To_String(now));
      print("--           "&MESS1&" --> "&MESS2);
      print("--           Pulse width too short ("&To_String(WIDTH)&" instead of "&To_String(DURATION)&")");
      print((1 to 80 => '-'));
      print(" ");
      if (SEVERE = ERROR or SEVERE = FAILURE) then
       assert false severity SEVERE;
      end if;
     end if;
    end if;
  end loop;
 End CHECK_PULSE;

    -- synopsys synthesis_on
end utils;
