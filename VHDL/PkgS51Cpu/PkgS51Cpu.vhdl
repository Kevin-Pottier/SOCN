
Library IEEE;
 use IEEE.std_logic_1164.all;
Library LibPkg;
 use LibPkg.myutils.all;

package PkgS51Cpu is
--------------------------------------------------------------------------
-- USER CONFIG

 constant SYNTHESISFORFPGA	: boolean	:= false;
 constant TOTALROMBYTESIZE	: integer	:= 65536;
 constant TOTALXRAMBYTESIZE	: integer	:= 4096;

--------------------------------------------------------------------------
-- S51 CONFIG

 constant OpWord		: integer	:= 8;
 constant PcLenght		: integer	:= 16;

 constant RomAddressBusLenght	: integer	:= usize(TOTALROMBYTESIZE-1) - 2; -- code distributed into 4 ROM instances
-- constant RomDataBusLenght	: integer	:= 16;
 constant RomDataBusLenght	: integer	:= 8;

 constant AccuRegSize		: integer 	:= 8;
 constant AccuInitValue 	: std_logic_vector(7 downto 0) := (others => '0');
 constant BregInitValue 	: std_logic_vector(7 downto 0) := (others => '0');
 constant PswRegInitValue	: std_logic_vector(7 downto 0) := (others => '0');

 constant PeriphAddBusSize	: integer	:= 8;
 constant PeriphDataBusSize	: integer	:= 8;

 constant XRamAddBusSize	: integer	:= usize(TOTALXRAMBYTESIZE);
 constant XRamDataBusSize	: integer	:= 8;

 type T_OR is (OR_FETCH_OPCODE, OR_FETCH_D1, OR_FETCH_D2, OR_EXECUTE);

--------------------------------------------------------------------------
-- INSTRUCTIONS DATA
--------------------------------------------------------------------------

 

 constant NOP	: 	bit_vector(7 downto 0) := "00000000";	-- NOP 			(#00h, #FFh)

 constant AJMP0	: 	bit_vector(7 downto 0) := "00000001";	-- AJMP addr11 		(#01h, #1Fh)
 constant AJMP1	: 	bit_vector(7 downto 0) := "00100001";	-- AJMP addr11 		(#01h, #1Fh)
 constant AJMP2	: 	bit_vector(7 downto 0) := "01000001";	-- AJMP addr11 		(#01h, #1Fh)
 constant AJMP3	: 	bit_vector(7 downto 0) := "01100001";	-- AJMP addr11 		(#01h, #1Fh)
 constant AJMP4	: 	bit_vector(7 downto 0) := "10000001";	-- AJMP addr11 		(#01h, #1Fh)
 constant AJMP5	: 	bit_vector(7 downto 0) := "10100001";	-- AJMP addr11 		(#01h, #1Fh)
 constant AJMP6	: 	bit_vector(7 downto 0) := "11000001";	-- AJMP addr11 		(#01h, #1Fh)
 constant AJMP7	: 	bit_vector(7 downto 0) := "11100001";	-- AJMP addr11 		(#01h, #1Fh)      

 constant LJMP	: 	bit_vector(7 downto 0) := "00000010";	-- LJMP addr16 		(#02h, #FFh)
 constant RR	: 	bit_vector(7 downto 0) := "00000011";	-- RR A 		(#03h, #FFh)
 constant INC	: 	bit_vector(7 downto 0) := "00000100";	-- INC A 		(#04h, #FFh)
 constant INC1	: 	bit_vector(7 downto 0) := "00000101";	-- INC direct 		(#05h, #FFh)

 constant INC3R0: 	bit_vector(7 downto 0) := "00000110";	-- INC @R0 		(#06h, #FEh)
 constant INC3R1: 	bit_vector(7 downto 0) := "00000111";	-- INC @R1 		(#06h, #FEh)

 constant INC2R0: 	bit_vector(7 downto 0) := "00001000";	-- INC R0 		(#08h, #F8h)
 constant INC2R1: 	bit_vector(7 downto 0) := "00001001";	-- INC R1 		(#08h, #F8h)
 constant INC2R2: 	bit_vector(7 downto 0) := "00001010";	-- INC R2 		(#08h, #F8h)
 constant INC2R3: 	bit_vector(7 downto 0) := "00001011";	-- INC R3 		(#08h, #F8h)
 constant INC2R4: 	bit_vector(7 downto 0) := "00001100";	-- INC R4 		(#08h, #F8h)
 constant INC2R5: 	bit_vector(7 downto 0) := "00001101";	-- INC R5 		(#08h, #F8h)
 constant INC2R6: 	bit_vector(7 downto 0) := "00001110";	-- INC R6 		(#08h, #F8h)
 constant INC2R7: 	bit_vector(7 downto 0) := "00001111";	-- INC R7 		(#08h, #F8h)

 constant JBC	: 	bit_vector(7 downto 0) := "00010000";	-- JBC bit,rel 		(#10h, #FFh)

 constant ACALL0: 	bit_vector(7 downto 0) := "00010001";	-- ACALL addr11 	(#11h, #1Fh)
 constant ACALL1: 	bit_vector(7 downto 0) := "00110001";	-- ACALL addr11 	(#11h, #1Fh)
 constant ACALL2: 	bit_vector(7 downto 0) := "01010001";	-- ACALL addr11 	(#11h, #1Fh) 
 constant ACALL3: 	bit_vector(7 downto 0) := "01110001";	-- ACALL addr11 	(#11h, #1Fh)
 constant ACALL4: 	bit_vector(7 downto 0) := "10010001";	-- ACALL addr11 	(#11h, #1Fh)
 constant ACALL5: 	bit_vector(7 downto 0) := "10110001";	-- ACALL addr11 	(#11h, #1Fh)
 constant ACALL6: 	bit_vector(7 downto 0) := "11010001";	-- ACALL addr11 	(#11h, #1Fh)
 constant ACALL7: 	bit_vector(7 downto 0) := "11110001";	-- ACALL addr11 	(#11h, #1Fh)

 constant LCALL	: 	bit_vector(7 downto 0) := "00010010";	-- LCALL addr16 	(#12h, #FFh)
 constant RRC	: 	bit_vector(7 downto 0) := "00010011";	-- RRC A 		(#13h, #FFh)
 constant DEC	: 	bit_vector(7 downto 0) := "00010100";	-- DEC A 		(#14h, #FFh)
 constant DEC1	: 	bit_vector(7 downto 0) := "00010101";	-- DEC direct 		(#15h, #FFh)

 constant DEC3R0: 	bit_vector(7 downto 0) := "00010110";	-- DEC @R0 		(#16h, #FEh)
 constant DEC3R1: 	bit_vector(7 downto 0) := "00010111";	-- DEC @R0 		(#16h, #FEh)

 constant DEC2R0: 	bit_vector(7 downto 0) := "00011000";	-- DEC R0 		(#18h, #F8h)
 constant DEC2R1: 	bit_vector(7 downto 0) := "00011001";	-- DEC R1 		(#18h, #F8h)
 constant DEC2R2: 	bit_vector(7 downto 0) := "00011010";	-- DEC R2 		(#18h, #F8h)
 constant DEC2R3: 	bit_vector(7 downto 0) := "00011011";	-- DEC R3 		(#18h, #F8h)
 constant DEC2R4: 	bit_vector(7 downto 0) := "00011100";	-- DEC R4 		(#18h, #F8h)
 constant DEC2R5: 	bit_vector(7 downto 0) := "00011101";	-- DEC R5 		(#18h, #F8h)
 constant DEC2R6: 	bit_vector(7 downto 0) := "00011110";	-- DEC R6 		(#18h, #F8h)
 constant DEC2R7: 	bit_vector(7 downto 0) := "00011111";	-- DEC R7 		(#18h, #F8h)

 constant JB	: 	bit_vector(7 downto 0) := "00100000";	-- JB bit,rel 		(#20h, #FFh)
 constant RET	: 	bit_vector(7 downto 0) := "00100010";	-- RET 			(#22h, #FFh)
 constant RL	: 	bit_vector(7 downto 0) := "00100011";	-- RL A 		(#23h, #FFh)
 constant ADD2	: 	bit_vector(7 downto 0) := "00100100";	-- ADD A,#data 		(#24h, #FFh)
 constant ADD	: 	bit_vector(7 downto 0) := "00100101";	-- ADD A,direct 	(#25h, #FFh)

 constant ADD3R0: 	bit_vector(7 downto 0) := "00100110";	-- ADD A,@R0 		(#26h, #FEh)
 constant ADD3R1: 	bit_vector(7 downto 0) := "00100111";	-- ADD A,@R1 		(#26h, #FEh)

 constant ADD1R0: 	bit_vector(7 downto 0) := "00101000";	-- ADD A,R0 		(#28h, #F8h)
 constant ADD1R1: 	bit_vector(7 downto 0) := "00101001";	-- ADD A,R1 		(#28h, #F8h)
 constant ADD1R2: 	bit_vector(7 downto 0) := "00101010";	-- ADD A,R2 		(#28h, #F8h)
 constant ADD1R3: 	bit_vector(7 downto 0) := "00101011";	-- ADD A,R3 		(#28h, #F8h)
 constant ADD1R4: 	bit_vector(7 downto 0) := "00101100";	-- ADD A,R4 		(#28h, #F8h)
 constant ADD1R5: 	bit_vector(7 downto 0) := "00101101";	-- ADD A,R5 		(#28h, #F8h)
 constant ADD1R6: 	bit_vector(7 downto 0) := "00101110";	-- ADD A,R6 		(#28h, #F8h)
 constant ADD1R7: 	bit_vector(7 downto 0) := "00101111";	-- ADD A,R7 		(#28h, #F8h)
       

 constant JNB	: 	bit_vector(7 downto 0) := "00110000";	-- JNB bit, rel 	(#30h, #FFh)
 constant RETI	: 	bit_vector(7 downto 0) := "00110010";	-- RETI 		(#32h, #FFh)
 constant RLC	: 	bit_vector(7 downto 0) := "00110011";	-- RLC A 		(#33h, #FFh)
 constant ADDC1	: 	bit_vector(7 downto 0) := "00110100";	-- ADDC A, #data	(#34h, #FFh)
 constant ADDC	: 	bit_vector(7 downto 0) := "00110101";	-- ADDC A, direct 	(#35h, #FFh)

 constant ADDC2R0: 	bit_vector(7 downto 0) := "00110110";	-- ADDC A, @R0 		(#36h, #FEh)
 constant ADDC2R1: 	bit_vector(7 downto 0) := "00110111";	-- ADDC A, @R1 		(#36h, #FEh)



 constant ADDC3R0: 	bit_vector(7 downto 0) := "00111000";	-- ADDC A,R0 		(#38h, #F8h)
 constant ADDC3R1: 	bit_vector(7 downto 0) := "00111001";	-- ADDC A,R1 		(#38h, #F8h)
 constant ADDC3R2: 	bit_vector(7 downto 0) := "00111010";	-- ADDC A,R2 		(#38h, #F8h)
 constant ADDC3R3: 	bit_vector(7 downto 0) := "00111011";	-- ADDC A,R3 		(#38h, #F8h)
 constant ADDC3R4: 	bit_vector(7 downto 0) := "00111100";	-- ADDC A,R4 		(#38h, #F8h)
 constant ADDC3R5: 	bit_vector(7 downto 0) := "00111101";	-- ADDC A,R5 		(#38h, #F8h)
 constant ADDC3R6: 	bit_vector(7 downto 0) := "00111110";	-- ADDC A,R6 		(#38h, #F8h)
 constant ADDC3R7: 	bit_vector(7 downto 0) := "00111111";	-- ADDC A,R7 		(#38h, #F8h)
 
 
 constant JC	: 	bit_vector(7 downto 0) := "01000000";	-- JC rel 		(#40h, #FFh)
 constant ORL4	: 	bit_vector(7 downto 0) := "01000010";	-- ORL direct, A 	(#42h, #FFh)
 constant ORL7	: 	bit_vector(7 downto 0) := "01000011";	-- ORL direct, #data 	(#43h, #FFh)
 constant ORL2	: 	bit_vector(7 downto 0) := "01000100";	-- ORL A, #data 	(#44h, #FFh)
 constant ORL	: 	bit_vector(7 downto 0) := "01000101";	-- ORL A, direct 	(#45h, #FFh)

 constant ORL3R0: 	bit_vector(7 downto 0) := "01000110";	-- ORL A, @R0 		(#46h, #FEh)
 constant ORL3R1: 	bit_vector(7 downto 0) := "01000111";	-- ORL A, @R0 		(#46h, #FEh)

 constant ORL1R0: 	bit_vector(7 downto 0) := "01001000";	-- ORL A, R0 		(#48h, #F8h)
 constant ORL1R1: 	bit_vector(7 downto 0) := "01001001";	-- ORL A, R1 		(#48h, #F8h)
 constant ORL1R2: 	bit_vector(7 downto 0) := "01001010";	-- ORL A, R2 		(#48h, #F8h)
 constant ORL1R3: 	bit_vector(7 downto 0) := "01001011";	-- ORL A, R3 		(#48h, #F8h)
 constant ORL1R4: 	bit_vector(7 downto 0) := "01001100";	-- ORL A, R4 		(#48h, #F8h)
 constant ORL1R5: 	bit_vector(7 downto 0) := "01001101";	-- ORL A, R5 		(#48h, #F8h)
 constant ORL1R6: 	bit_vector(7 downto 0) := "01001110";	-- ORL A, R6 		(#48h, #F8h)
 constant ORL1R7: 	bit_vector(7 downto 0) := "01001111";	-- ORL A, R7 		(#48h, #F8h) 
 
 constant JNC	: 	bit_vector(7 downto 0) := "01010000";	-- JNC rel 		(#50h, #FFh)
 constant ANL4	: 	bit_vector(7 downto 0) := "01010010";	-- ANL direct, A 	(#52h, #FFh)
 constant ANL7	: 	bit_vector(7 downto 0) := "01010011";	-- ANL direct, #data 	(#53h, #FFh)
 constant ANL2	: 	bit_vector(7 downto 0) := "01010100";	-- ANL A, #data 	(#54h, #FFh)
 constant ANL	: 	bit_vector(7 downto 0) := "01010101";	-- ANL A, direct 	(#55h, #FFh)

 constant ANL3R0: 	bit_vector(7 downto 0) := "01010110";	-- ANL A, @R0 		(#56h, #FEh)
 constant ANL3R1: 	bit_vector(7 downto 0) := "01010111";	-- ANL A, @R1 		(#56h, #FEh)

 constant ANL1R0: 	bit_vector(7 downto 0) := "01011000";	-- ANL A, R0 		(#58h, #F8h)
 constant ANL1R1: 	bit_vector(7 downto 0) := "01011001";	-- ANL A, R1 		(#58h, #F8h)
 constant ANL1R2: 	bit_vector(7 downto 0) := "01011010";	-- ANL A, R2 		(#58h, #F8h)
 constant ANL1R3: 	bit_vector(7 downto 0) := "01011011";	-- ANL A, R3 		(#58h, #F8h)
 constant ANL1R4: 	bit_vector(7 downto 0) := "01011100";	-- ANL A, R4 		(#58h, #F8h)
 constant ANL1R5: 	bit_vector(7 downto 0) := "01011101";	-- ANL A, R5 		(#58h, #F8h)
 constant ANL1R6: 	bit_vector(7 downto 0) := "01011110";	-- ANL A, R6 		(#58h, #F8h)
 constant ANL1R7: 	bit_vector(7 downto 0) := "01011111";	-- ANL A, R7 		(#58h, #F8h)      

 constant JZ	: 	bit_vector(7 downto 0) := "01100000";	-- JZ rel 		(#60h, #FFh)
 constant XRL4	: 	bit_vector(7 downto 0) := "01100010";	-- XRL direct, A 	(#62h, #FFh)
 constant XRL5	: 	bit_vector(7 downto 0) := "01100011";	-- XRL direct, #data 	(#63h, #FFh)
 constant XRL2	: 	bit_vector(7 downto 0) := "01100100";	-- XRL A, #data 	(#64h, #FFh)
 constant XRL	: 	bit_vector(7 downto 0) := "01100101";	-- XRL A, direct 	(#65h, #FFh)

 constant XRL3R0: 	bit_vector(7 downto 0) := "01100110";	-- XRL A, @R0 		(#66h, #FEh)
 constant XRL3R1: 	bit_vector(7 downto 0) := "01100111";	-- XRL A, @R1 		(#66h, #FEh)
 
 constant XRL1R0: 	bit_vector(7 downto 0) := "01101000";	-- XRL A, R0 		(#68h, #F8h)
 constant XRL1R1: 	bit_vector(7 downto 0) := "01101001";	-- XRL A, R1 		(#68h, #F8h)
 constant XRL1R2: 	bit_vector(7 downto 0) := "01101010";	-- XRL A, R2 		(#68h, #F8h)
 constant XRL1R3: 	bit_vector(7 downto 0) := "01101011";	-- XRL A, R3 		(#68h, #F8h)
 constant XRL1R4: 	bit_vector(7 downto 0) := "01101100";	-- XRL A, R4 		(#68h, #F8h)
 constant XRL1R5: 	bit_vector(7 downto 0) := "01101101";	-- XRL A, R5 		(#68h, #F8h)
 constant XRL1R6: 	bit_vector(7 downto 0) := "01101110";	-- XRL A, R6 		(#68h, #F8h)
 constant XRL1R7: 	bit_vector(7 downto 0) := "01101111";	-- XRL A, R7 		(#68h, #F8h)
 
 constant JNZ	: 	bit_vector(7 downto 0) := "01110000";	-- JNZ rel 		(#70h, #FFh)
 constant ORL5	: 	bit_vector(7 downto 0) := "01110010";	-- ORL C, bit 		(#72h, #FFh)
 constant JMP	: 	bit_vector(7 downto 0) := "01110011";	-- JMP @A+DPTR 		(#73h, #FFh)
 constant MOV2	: 	bit_vector(7 downto 0) := "01110100";	-- MOV A, #data 	(#74h, #FFh)
 constant MOV14	: 	bit_vector(7 downto 0) := "01110101";	-- MOV direct, #data 	(#75h, #FFh)

 constant MOV10R0: 	bit_vector(7 downto 0) := "01110110";	-- MOV @R0, #data 	(#76h, #FEh)
 constant MOV10R1: 	bit_vector(7 downto 0) := "01110111";	-- MOV @R1, #data 	(#76h, #FEh)

 constant MOV8R0: 	bit_vector(7 downto 0) := "01111000";	-- MOV R0, #data 	(#78h, #F8h)
 constant MOV8R1: 	bit_vector(7 downto 0) := "01111001";	-- MOV R1, #data 	(#78h, #F8h)
 constant MOV8R2: 	bit_vector(7 downto 0) := "01111010";	-- MOV R2, #data 	(#78h, #F8h)
 constant MOV8R3: 	bit_vector(7 downto 0) := "01111011";	-- MOV R3, #data 	(#78h, #F8h)
 constant MOV8R4: 	bit_vector(7 downto 0) := "01111100";	-- MOV R4, #data 	(#78h, #F8h)
 constant MOV8R5: 	bit_vector(7 downto 0) := "01111101";	-- MOV R5, #data 	(#78h, #F8h)
 constant MOV8R6: 	bit_vector(7 downto 0) := "01111110";	-- MOV R6, #data 	(#78h, #F8h)
 constant MOV8R7: 	bit_vector(7 downto 0) := "01111111";	-- MOV R7, #data 	(#78h, #F8h)      
 
 constant SJMP	: 	bit_vector(7 downto 0) := "10000000";	-- SJMP rel 		(#80h, #FFh)
 constant ANL5	: 	bit_vector(7 downto 0) := "10000010";	-- ANL C, bit 		(#82h, #FFh)
 constant MOVC1	: 	bit_vector(7 downto 0) := "10000011";	-- MOVC A, @A+PC 	(#83h, #FFh)
 constant DIV	: 	bit_vector(7 downto 0) := "10000100";	-- DIV AB 		(#84h, #FFh)
 constant MOV12	: 	bit_vector(7 downto 0) := "10000101";	-- MOV direct1, direct2 (#85h, #FFh)

 constant MOV15R0: 	bit_vector(7 downto 0) := "10000110";	-- MOV direct, @R0 	(#86h, #FEh)
 constant MOV15R1: 	bit_vector(7 downto 0) := "10000111";	-- MOV direct, @R1 	(#86h, #FEh)

 constant MOV13R0: 	bit_vector(7 downto 0) := "10001000";	-- MOV direct, R0 	(#88h, #F8h)
 constant MOV13R1: 	bit_vector(7 downto 0) := "10001001";	-- MOV direct, R1 	(#88h, #F8h)
 constant MOV13R2: 	bit_vector(7 downto 0) := "10001010";	-- MOV direct, R2 	(#88h, #F8h)
 constant MOV13R3: 	bit_vector(7 downto 0) := "10001011";	-- MOV direct, R3 	(#88h, #F8h)
 constant MOV13R4: 	bit_vector(7 downto 0) := "10001100";	-- MOV direct, R4 	(#88h, #F8h)
 constant MOV13R5: 	bit_vector(7 downto 0) := "10001101";	-- MOV direct, R5 	(#88h, #F8h)
 constant MOV13R6: 	bit_vector(7 downto 0) := "10001110";	-- MOV direct, R6 	(#88h, #F8h)
 constant MOV13R7: 	bit_vector(7 downto 0) := "10001111";	-- MOV direct, R7 	(#88h, #F8h)
   
 constant MOV16	: 	bit_vector(7 downto 0) := "10010000";	-- MOV DPTR, #data16 	(#90h, #FFh)
 constant MOV11	: 	bit_vector(7 downto 0) := "10010010";	-- MOV bit, C 		(#92h, #FFh)
 constant MOVC	: 	bit_vector(7 downto 0) := "10010011";	-- MOVC A, @A+DPTR 	(#93h, #FFh)
 constant SUBB2	: 	bit_vector(7 downto 0) := "10010100";	-- SUBB A, #data 	(#94h, #FFh)
 constant SUBB	: 	bit_vector(7 downto 0) := "10010101";	-- SUBB A, direct 	(#95h, #FFh)

 constant SUBB3R0: 	bit_vector(7 downto 0) := "10010110";	-- SUBB A, @R0 		(#96h, #FEh)
 constant SUBB3R1: 	bit_vector(7 downto 0) := "10010111";	-- SUBB A, @R1 		(#96h, #FEh)

 constant SUBB1R0: 	bit_vector(7 downto 0) := "10011000";	-- SUBB A, R0 		(#98h, #F8h)
 constant SUBB1R1: 	bit_vector(7 downto 0) := "10011001";	-- SUBB A, R1 		(#98h, #F8h)
 constant SUBB1R2: 	bit_vector(7 downto 0) := "10011010";	-- SUBB A, R2 		(#98h, #F8h)
 constant SUBB1R3: 	bit_vector(7 downto 0) := "10011011";	-- SUBB A, R3 		(#98h, #F8h)
 constant SUBB1R4: 	bit_vector(7 downto 0) := "10011100";	-- SUBB A, R4 		(#98h, #F8h)
 constant SUBB1R5: 	bit_vector(7 downto 0) := "10011101";	-- SUBB A, R5 		(#98h, #F8h)
 constant SUBB1R6: 	bit_vector(7 downto 0) := "10011110";	-- SUBB A, R6 		(#98h, #F8h)
 constant SUBB1R7: 	bit_vector(7 downto 0) := "10011111";	-- SUBB A, R7 		(#98h, #F8h)
  
 constant ORL6	: 	bit_vector(7 downto 0) := "10100000";	-- ORL C, /bit 		(#A0h, #FFh)
 constant MOV5	: 	bit_vector(7 downto 0) := "10100010";	-- MOV C, bit 		(#A2h, #FFh)
 constant INC4	: 	bit_vector(7 downto 0) := "10100011";	-- INC DPTR 		(#A3h, #FFh)
 constant MUL	: 	bit_vector(7 downto 0) := "10100100";	-- MUL AB 		(#A4h, #FFh)
 constant ESCAPE: 	bit_vector(7 downto 0) := "10100101";	-- ESCAPE	 	(#A5h, #FFh)

 constant MOV18R0: 	bit_vector(7 downto 0) := "10100110";	-- MOV @R0, direct 	(#A6h, #FEh)
 constant MOV18R1: 	bit_vector(7 downto 0) := "10100111";	-- MOV @R1, direct 	(#A6h, #FEh)

 constant MOV17R0: 	bit_vector(7 downto 0) := "10101000";	-- MOV R0, direct 	(#A8h, #F8h)
 constant MOV17R1: 	bit_vector(7 downto 0) := "10101001";	-- MOV R1, direct 	(#A8h, #F8h)
 constant MOV17R2: 	bit_vector(7 downto 0) := "10101010";	-- MOV R2, direct 	(#A8h, #F8h)
 constant MOV17R3: 	bit_vector(7 downto 0) := "10101011";	-- MOV R3, direct 	(#A8h, #F8h)
 constant MOV17R4: 	bit_vector(7 downto 0) := "10101100";	-- MOV R4, direct 	(#A8h, #F8h)
 constant MOV17R5: 	bit_vector(7 downto 0) := "10101101";	-- MOV R5, direct 	(#A8h, #F8h)
 constant MOV17R6: 	bit_vector(7 downto 0) := "10101110";	-- MOV R6, direct 	(#A8h, #F8h)
 constant MOV17R7: 	bit_vector(7 downto 0) := "10101111";	-- MOV R7, direct 	(#A8h, #F8h)

 constant ANL6	: 	bit_vector(7 downto 0) := "10110000";	-- ANL C, /bit 		(#B0h, #FFh)
 constant CPL1	: 	bit_vector(7 downto 0) := "10110010";	-- CPL bit 		(#B2h, #FFh)
 constant CPL2	: 	bit_vector(7 downto 0) := "10110011";	-- CPL C 		(#B3h, #FFh)
 constant CJNE1	: 	bit_vector(7 downto 0) := "10110100";	-- CJNE A, #data, rel 	(#B4h, #FFh)
 constant CJNE	: 	bit_vector(7 downto 0) := "10110101";	-- CJNE A, direct, rel 	(#B5h, #FFh)

 constant CJNE3R0: 	bit_vector(7 downto 0) := "10110110";	-- CJNE @R0, #data, rel (#B6h, #FEh)
 constant CJNE3R1: 	bit_vector(7 downto 0) := "10110111";	-- CJNE @R0, #data, rel (#B6h, #FEh)

 constant CJNE2R0: 	bit_vector(7 downto 0) := "10111000";	-- CJNE R0, #data, rel 	(#B8h, #F8h)
 constant CJNE2R1: 	bit_vector(7 downto 0) := "10111001";	-- CJNE R1, #data, rel 	(#B8h, #F8h)
 constant CJNE2R2: 	bit_vector(7 downto 0) := "10111010";	-- CJNE R2, #data, rel 	(#B8h, #F8h)
 constant CJNE2R3: 	bit_vector(7 downto 0) := "10111011";	-- CJNE R3, #data, rel 	(#B8h, #F8h)
 constant CJNE2R4: 	bit_vector(7 downto 0) := "10111100";	-- CJNE R4, #data, rel 	(#B8h, #F8h)
 constant CJNE2R5: 	bit_vector(7 downto 0) := "10111101";	-- CJNE R5, #data, rel 	(#B8h, #F8h)
 constant CJNE2R6: 	bit_vector(7 downto 0) := "10111110";	-- CJNE R6, #data, rel 	(#B8h, #F8h)
 constant CJNE2R7: 	bit_vector(7 downto 0) := "10111111";	-- CJNE R7, #data, rel 	(#B8h, #F8h)

 constant PUSH	: 	bit_vector(7 downto 0) := "11000000";	-- PUSH direct 		(#C0h, #FFh)
 constant CLR1	: 	bit_vector(7 downto 0) := "11000010";	-- CLR bit 		(#C2h, #FFh)
 constant CLR2	: 	bit_vector(7 downto 0) := "11000011";	-- CLR C 		(#C3h, #FFh)
 constant SWAP	: 	bit_vector(7 downto 0) := "11000100";	-- SWAP A 		(#C4h, #FFh)
 constant XCH	: 	bit_vector(7 downto 0) := "11000101";	-- XCH A, direct 	(#C5h, #FFh)

 constant XCH2R0: 	bit_vector(7 downto 0) := "11000110";	-- XCH A, @R0 		(#C6h, #FEh)
 constant XCH2R1: 	bit_vector(7 downto 0) := "11000111";	-- XCH A, @R1 		(#C6h, #FEh)
 
 constant XCH1R0: 	bit_vector(7 downto 0) := "11001000";	-- XCH A, R0 		(#C8h, #F8h)
 constant XCH1R1: 	bit_vector(7 downto 0) := "11001001";	-- XCH A, R1 		(#C8h, #F8h)
 constant XCH1R2: 	bit_vector(7 downto 0) := "11001010";	-- XCH A, R2 		(#C8h, #F8h)
 constant XCH1R3: 	bit_vector(7 downto 0) := "11001011";	-- XCH A, R3 		(#C8h, #F8h)
 constant XCH1R4: 	bit_vector(7 downto 0) := "11001100";	-- XCH A, R4 		(#C8h, #F8h)
 constant XCH1R5: 	bit_vector(7 downto 0) := "11001101";	-- XCH A, R5 		(#C8h, #F8h)
 constant XCH1R6: 	bit_vector(7 downto 0) := "11001110";	-- XCH A, R6 		(#C8h, #F8h)
 constant XCH1R7: 	bit_vector(7 downto 0) := "11001111";	-- XCH A, R7 		(#C8h, #F8h)     
 
 constant POP	: 	bit_vector(7 downto 0) := "11010000";	-- POP direct 		(#D0h, #FFh)
 constant SETB	: 	bit_vector(7 downto 0) := "11010010";	-- SETB bit 		(#D2h, #FFh)
 constant SETB1	: 	bit_vector(7 downto 0) := "11010011";	-- SETB C 		(#D3h, #FFh)
 constant DA	: 	bit_vector(7 downto 0) := "11010100";	-- DA A 		(#D4h, #FFh)
 constant DJNZ	: 	bit_vector(7 downto 0) := "11010101";	-- DJNZ direct, rel 	(#D5h, #FFh)

 constant XCHDR0: 	bit_vector(7 downto 0) := "11010110";	-- XCHD A, @R0 		(#D6h, #FEh)
 constant XCHDR1: 	bit_vector(7 downto 0) := "11010111";	-- XCHD A, @R1 		(#D6h, #FEh)
 
 constant DJNZ1R0: 	bit_vector(7 downto 0) := "11011000";	-- DJNZ R0, rel 	(#D8h, #F8h)
 constant DJNZ1R1: 	bit_vector(7 downto 0) := "11011001";	-- DJNZ R1, rel 	(#D8h, #F8h)
 constant DJNZ1R2: 	bit_vector(7 downto 0) := "11011010";	-- DJNZ R2, rel 	(#D8h, #F8h)
 constant DJNZ1R3: 	bit_vector(7 downto 0) := "11011011";	-- DJNZ R3, rel 	(#D8h, #F8h)
 constant DJNZ1R4: 	bit_vector(7 downto 0) := "11011100";	-- DJNZ R4, rel 	(#D8h, #F8h)
 constant DJNZ1R5: 	bit_vector(7 downto 0) := "11011101";	-- DJNZ R5, rel 	(#D8h, #F8h)
 constant DJNZ1R6: 	bit_vector(7 downto 0) := "11011110";	-- DJNZ R6, rel 	(#D8h, #F8h)
 constant DJNZ1R7: 	bit_vector(7 downto 0) := "11011111";	-- DJNZ R7, rel 	(#D8h, #F8h)      

 constant MOVX	: 	bit_vector(7 downto 0) := "11100000";	-- MOVX A, @DPTR 	(#E0h, #FFh)

 constant MOVX1R0: 	bit_vector(7 downto 0) := "11100010";	-- MOVX A, @R0 		(#E2h, #FEh)
 constant MOVX1R1: 	bit_vector(7 downto 0) := "11100011";	-- MOVX A, @R0 		(#E2h, #FEh)
 
 constant CLR	: 	bit_vector(7 downto 0) := "11100100";	-- CLR A 		(#E4h, #FFh)
 constant MOV	: 	bit_vector(7 downto 0) := "11100101";	-- MOV A, direct 	(#E5h, #FFh)

 constant MOV3R0: 	bit_vector(7 downto 0) := "11100110";	-- MOV A, @R0 		(#E6h, #FEh)
 constant MOV3R1: 	bit_vector(7 downto 0) := "11100111";	-- MOV A, @R1 		(#E6h, #FEh)

 constant MOV1R0: 	bit_vector(7 downto 0) := "11101000";	-- MOV A, R0 		(#E8h, #F8h)
 constant MOV1R1: 	bit_vector(7 downto 0) := "11101001";	-- MOV A, R1 		(#E8h, #F8h)
 constant MOV1R2: 	bit_vector(7 downto 0) := "11101010";	-- MOV A, R2 		(#E8h, #F8h)
 constant MOV1R3: 	bit_vector(7 downto 0) := "11101011";	-- MOV A, R3 		(#E8h, #F8h)
 constant MOV1R4: 	bit_vector(7 downto 0) := "11101100";	-- MOV A, R4 		(#E8h, #F8h)
 constant MOV1R5: 	bit_vector(7 downto 0) := "11101101";	-- MOV A, R5 		(#E8h, #F8h)
 constant MOV1R6: 	bit_vector(7 downto 0) := "11101110";	-- MOV A, R6 		(#E8h, #F8h)
 constant MOV1R7: 	bit_vector(7 downto 0) := "11101111";	-- MOV A, R7 		(#E8h, #F8h)
 
 constant MOVX2	: 	bit_vector(7 downto 0) := "11110000";	-- MOVX @DPTR, A 	(#F0h, #FFh)

 constant MOVX3R0: 	bit_vector(7 downto 0) := "11110010";	-- MOVX @R0, A 		(#F2h, #FEh)
 constant MOVX3R1: 	bit_vector(7 downto 0) := "11110011";	-- MOVX @R1, A 		(#F2h, #FEh) 

 constant CPL	: 	bit_vector(7 downto 0) := "11110100";	-- CPL A 		(#F4h, #FFh)
 constant MOV6	: 	bit_vector(7 downto 0) := "11110101";	-- MOV direct, A 	(#F5h, #FFh)

 constant MOV9R0: 	bit_vector(7 downto 0) := "11110110";	-- MOV @R0, A 		(#F6h, #FEh)
 constant MOV9R1: 	bit_vector(7 downto 0) := "11110111";	-- MOV @R0, A 		(#F6h, #FEh)

 constant MOV7R0: 	bit_vector(7 downto 0) := "11111000";	-- MOV R0, A 		(#F8h, #F8h)
 constant MOV7R1: 	bit_vector(7 downto 0) := "11111001";	-- MOV R1, A 		(#F8h, #F8h)
 constant MOV7R2: 	bit_vector(7 downto 0) := "11111010";	-- MOV R2, A 		(#F8h, #F8h)
 constant MOV7R3: 	bit_vector(7 downto 0) := "11111011";	-- MOV R3, A 		(#F8h, #F8h)
 constant MOV7R4: 	bit_vector(7 downto 0) := "11111100";	-- MOV R4, A 		(#F8h, #F8h)
 constant MOV7R5: 	bit_vector(7 downto 0) := "11111101";	-- MOV R5, A 		(#F8h, #F8h)
 constant MOV7R6: 	bit_vector(7 downto 0) := "11111110";	-- MOV R6, A 		(#F8h, #F8h)
 constant MOV7R7: 	bit_vector(7 downto 0) := "11111111";	-- MOV R7, A 		(#F8h, #F8h)

-- function Isopcode 	(PlaOp: T_OPCODE; ReaderOp: std_logic_vector(7 downto 0)) return boolean;
-- function usize(Nb: integer) return integer;
 
--################################# STACK SECTION #######################################

-- Types declaration
 type StackCmd is (push16, pop16, push8, pop8); 
 type T_ARRAYOF8BITS is array (natural range <>) of std_logic_vector(7 downto 0);

-- Generic parameters
 constant BANKREGBYTENUMBER	: integer := 256;
 constant StackRegSize		: integer := 8;

-- Derived parameter 
 constant StackAddSize		: integer := 8; -- usize(BANKREGBYTENUMBER);
 constant RegFileAddSize	: integer := StackAddSize;
 constant RegFileSize		: integer := BANKREGBYTENUMBER;
-- Constants
 constant SPInitValue		: std_logic_vector(7 downto 0) := "00000111";

 Function sizeofopcode(Opcode_bitvector: bit_vector(OpWord - 1 downto 0)) return integer;

end PkgS51Cpu;

package body PkgS51Cpu is

-- function Isopcode 	(PlaOp: T_OPCODE; ReaderOp: std_logic_vector(7 downto 0)) return boolean is
-- begin
--  return ((PlaOp(0) and ReaderOp) = PlaOp(1));
-- end;
 
-- function usize(Nb: integer) Return integer is
--  variable A    : integer := Nb -1;
--  variable Size : integer := 0;
-- begin
--  if (A < 1) Then
--   return 1;
--  else
--   while (A /= 0) Loop
--   A    := A / 2;
--   Size := Size + 1;
--   end Loop;
--   return Size;
--  end if;
-- end usize;


 function sizeofopcode(Opcode_bitvector: bit_vector(OpWord - 1 downto 0)) Return integer is
 begin


case Opcode_bitvector is

when NOP =>   return 1;
when ADD =>   return 2;
when 	ADD1R0 | ADD1R1 | ADD1R2 | ADD1R3 |
ADD1R4 | ADD1R5 | ADD1R6 | ADD1R7 =>
return 1;
when ADD2 =>   return 2;
when ADD3R0 | ADD3R1 =>   return 1;
when ADDC =>
return 2;
when ADDC1 =>   return 2;   
when ADDC2R0 | ADDC2R1 =>   return 1;
when	ADDC3R0 | ADDC3R1 | ADDC3R2 | ADDC3R3 |
ADDC3R4 | ADDC3R5 | ADDC3R6 | ADDC3R7 =>   return 1;
when ANL =>   return 2;
when	ANL1R0 | ANL1R1 | ANL1R2 | ANL1R3 |
ANL1R4 | ANL1R5 | ANL1R6 | ANL1R7 =>   return 1;
when ANL2 =>   return 2;
when ANL3R0 | ANL3R1 =>   return 1;
when ANL4 =>   return 2;
when CLR =>   return 1;
when CLR1 =>   return 2;
when CLR2 =>   return 1;
when CPL =>   return 1;
when CPL1 =>   return 2;
when CPL2 =>   return 1;
when DA =>   return 1;
when DEC =>    return 1;
when DEC1 =>   return 2;
when 	DEC2R0 | DEC2R1 | DEC2R2 | DEC2R3 |
DEC2R4 | DEC2R5 | DEC2R6 | DEC2R7 =>   return 1;
when DEC3R0 | DEC3R1 =>   return 1;
when INC =>   return 1;
when INC1 =>   return 2;
when	INC2R0 | INC2R1  | INC2R2  | INC2R3 |
INC2R4 | INC2R5  | INC2R6  | INC2R7 =>   return 1;
when INC3R0 | INC3R1 =>   return 1;
when MOV =>   return 2;
when	MOV1R0 | MOV1R1 | MOV1R2 | MOV1R3 |
MOV1R4 | MOV1R5 | MOV1R6 | MOV1R7 =>   return 1;
when MOV2 =>   return 2;
when MOV3R0 | MOV3R1 =>   return 1;
when ESCAPE =>   return 1;
when MOV5 =>   return 2;
when MOV6 =>   return 2;   
when	MOV7R0 | MOV7R1 | MOV7R2 | MOV7R3 |
MOV7R4 | MOV7R5 | MOV7R6 | MOV7R7 =>   return 1;
when	MOV8R0 | MOV8R1 | MOV8R2 | MOV8R3 |
MOV8R4 | MOV8R5 | MOV8R6 | MOV8R7 =>   return 2;
when MOV9R0 | MOV9R1 =>   return 1;
when MOV10R0 | MOV10R1 =>   return 2;
when ORL =>   return 2;
when	ORL1R0 | ORL1R1 | ORL1R2 | ORL1R3 |
ORL1R4 | ORL1R5 | ORL1R6 | ORL1R7 =>   return 1;
when ORL2 =>   return 2;
when ORL3R0 | ORL3R1 =>   return 1;
when ORL4 =>   return 2;
when RL =>   return 1;
when RLC =>   return 1;
when RR =>   return 1;
when RRC =>   return 1;
when SETB =>   return 2;
when SETB1 =>	   return 1;
when SUBB =>   return 2;
when	SUBB1R0 | SUBB1R1 | SUBB1R2 | SUBB1R3 |
SUBB1R4 | SUBB1R5 | SUBB1R6 | SUBB1R7 =>   return 1;
when SUBB2 =>	   return 2;
when SUBB3R0 | SUBB3R1 =>   return 1;
when SWAP =>   return 1;
when XCH =>   return 2;
when	XCH1R0 | XCH1R1 | XCH1R2 | XCH1R3 |
XCH1R4 | XCH1R5 | XCH1R6 | XCH1R7 =>   return 1;
when XCH2R0 | XCH2R1 =>   return 1;
when XCHDR0 | XCHDR1 =>   return 1;
when XRL =>   return 2;
when	XRL1R0 | XRL1R1 | XRL1R2 | XRL1R3 |
XRL1R4 | XRL1R5 | XRL1R6 | XRL1R7 =>   return 1;
when XRL2 =>   return 2;
when XRL3R0 | XRL3R1 =>   return 1;
when XRL4 =>   return 2;
when	ACALL0 | ACALL1 | ACALL2 | ACALL3 |
ACALL4 | ACALL5 | ACALL6 | ACALL7 =>   return 2;
when	AJMP0 | AJMP1 | AJMP2 | AJMP3 |
AJMP4 | AJMP5 | AJMP6 | AJMP7 =>   return 2;
when ANL5 =>   return 2;
when ANL6 =>   return 2;
when ANL7 =>   return 3;
when CJNE =>   return 3;   
when CJNE1 =>   return 3;
when	CJNE2R0 | CJNE2R1 | CJNE2R2 | CJNE2R3 |
CJNE2R4 | CJNE2R5 | CJNE2R6 | CJNE2R7 =>   return 3;
when CJNE3R0 | CJNE3R1 =>   return 3;
when DJNZ =>   return 3;
when	DJNZ1R0 | DJNZ1R1 | DJNZ1R2 | DJNZ1R3 |
DJNZ1R4 | DJNZ1R5 | DJNZ1R6 | DJNZ1R7 =>   return 2;
when INC4 =>   return 1;
when JB =>   return 3;
when JBC =>   return 3;
when JC =>   return 2;
when JMP =>   return 1;
when JNB =>   return 3;
when JNC =>   return 2;
when JNZ =>   return 2;
when JZ =>   return 2;
when LCALL =>	   return 3;
when LJMP =>   return 3;
when MOV11 =>	   return 2;
when MOV12 =>	   return 3;
when	MOV13R0 | MOV13R1 | MOV13R2 | MOV13R3 |
MOV13R4 | MOV13R5 | MOV13R6 | MOV13R7 =>   return 2;
when MOV14 =>   return 3;
when MOV15R0 | MOV15R1 =>   return 2;
when MOV16 =>	   return 3;
when	MOV17R0 | MOV17R1 | MOV17R2 | MOV17R3 |
MOV17R4 | MOV17R5 | MOV17R6 | MOV17R7 =>    return 2;
when MOV18R0 | MOV18R1 =>   return 2;
when MOVC =>   return 1;
when MOVC1 =>   return 1;
when MOVX =>   return 1;
when MOVX1R0 | MOVX1R1  =>   return 1;
when MOVX2 =>   return 1;
when MOVX3R0 | MOVX3R1 =>   return 1;
when ORL5 =>   return 2;
when ORL6 =>	   return 2;
when ORL7 =>   return 3;
when POP =>   return 2;
when PUSH =>   return 2;
when RET | RETI =>   return 1;
when SJMP =>   return 2;
when XRL5 =>   return 3;
when DIV =>	 return 1;
when MUL =>   return 1;

end case;


 end sizeofopcode;







end;

