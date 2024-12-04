#!/usr/bin/perl


`head -n 8192 ./VIRAGE_rom0_i.txt > rom0_i.txt.low`;
`tail -n 8192 ./VIRAGE_rom0_i.txt > rom0_i.txt.high`;
`head -n 8192 ./VIRAGE_rom1_i.txt > rom1_i.txt.low`;
`tail -n 8192 ./VIRAGE_rom1_i.txt > rom1_i.txt.high`;

