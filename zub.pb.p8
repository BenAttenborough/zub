pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
#include main.lua
#include globals.lua
#include objects/player.lua
#include helpers.lua
#include debug.lua
#include states/statemachine.lua
#include states/menu.lua
__gfx__
000000000e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000e9e9e9e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000e99999e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000e9999ee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000e99eeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700e99eeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000eeeeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000e0e0e0e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000ee9ee9ee999999990e0e0e0e0e0e0e0e00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000e9e9e9e999999999e9e9e9e9e9e9e9e900000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000099e99e99999999999e9e9e9e9e9e9e9e00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009999999999999999e0e0e0e0e9e9e9e900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000009999999999999999000000009e9e9e9e00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000999999999999999900000000e9e9e9e900000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000e0e0e0e09999999999999999000000009e9e9e9e00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000e0e0e0e999999999999999900000000e0e0e0e000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077770009090000000000000000000000777700090900000077770009090000007777000909000000777700090900000077770009090000007777000909000
00700007090909000007777000909000007000070909090000700007090909000070000709090900007000070909090000700007090909000070000709090900
07000000700090900070000709090900070000007000909007000000700090900700000070009090070000007000909007000000700090900700000070009090
07070700700009000700000070009090070707007000090007070700700009000707070070000900070707007000090007070700700009000707070070000900
07000000700000900707070070000900070000007000009007000000700000900700000070000090070000007000009007000000700000900700000070000090
0700000070cc090007000000700000900700000070cc09000700000070cc09000700000070cc09000700000070cc09000700000070cc09000700000070cc0900
007000070cccc0000700000070cc0900007000070cccc000007000070cccc000007000070cccc000007000070cccc000007000070cccc000007000070cccc000
00077770ccc0cc00007000070cccc00000077770ccc0cc0000077770ccc0cc0000077770ccc0cc0000077770ccc0cc0000077770ccc0cc0000077770ccc0cc00
0000000cccc0cc0000077770ccc0cc000000000cccc0cc000000000cccc0cc000000000cccc0cc000000000cccc0cc000000000cccc0cc000000000cccc0cc00
990cccccccc0cc000000000cccc0cc00990cccccccc0cc00990cccccccc0cc00990cccccccc0cc00990cccccccc0cc00990cccccccc0cc00990cccccccc0cc00
09000ccccc007700990ccccccc00cc0009000ccccc00770009000ccccc00770009000cccccc0770009000ccccc00770009000cccccc0770009000ccccc007700
0000cc000c00070009000ccccc0077000000cc000c0007000000cc00cc00070000000cccc00007000000cc00cc000700000000ccc00007000000cc00cc000700
000cc000cc0077000000cc00cc000700000cc000cc0077000000cc00cc00770000000ccc0d0077000000cc00cc00770000000d0ccc7077000000cc00cc007700
0000cc0cc0000000000cc00cc00077000000cc0cc00000000000cc70cc0000000070ccc0dd7000000000cc00cc7000000070ddd0c77000000000cc00cc700000
00007700770000000000770077000000000077007700000000000770770000000007ccc0d700000000007700770000000007ddd0770000000000770077000000
000777077700000000077707770000000007770777000000000077077700000000007c0077000000000777077000000000007d00700000000007770770000000
00077770009090000077770009090000000777700090900000777700090900000000000000000000000000000000000000000000000000000000000000000000
00700007090909000700007090909000007000070909090007000070909090000000000000000000000000000000000000000000000000000000000000000000
07000000700090907000000700090900070000007000909070000007000909000007777000909000000000000000000000000000000000000000000000000000
07070700700009007070700700009000070707007000090070707007000090000070000709090900000777700090900000000000000000000000000000000000
07000000700000907000000700000900070000007000009070000007000009000700000070009090007000070909090000000000000000000000000000000000
0700000070cc0900700000070cc090000700000070cc0900700000070cc090000707070070000900070000007000909000000000000000000000000000000000
007000070cccc00007000070cccc0000007000070cccc00007000070cccc00000700000070000090070707007000090000000000000000000000000000000000
00077770ccc0cc0000777700cc0cc00000077770ccc0cc0000777700cc0cc0000700000070cc0900070000007000009000000000000000000000000000000000
0000000cccc0cc000000000cccc0cc000000000cccc0cc000000000cccc0cc00007000070cccc0000700000070cc000000000000000000000000000000000000
990cccccccc0cc00990cccccccc0cc00990cccccccc0cc00990cccccccc0cc0000077770ccccc000007000070cccc00000000000000000000000000000000000
09000ccccc00770009000ccccc00770009000ccccc00770009000ccccc0077000000000ccc0cc00000077770cc0cc00000000000000000000000000000000000
00000ccccc00070000000ccc0000070000000ccccc00070000000ccc00000700990ccccccc0770000000000ccc07700000000000000000000000000000000000
00000cc0cc0077000000ccc0d000770000000cc0cc0077000000d0ccc00077000900cc00cc007000990ccccccc00700000000000000000000000000000000000
0000ccc0cc000000007ccc0ddd7000000000ccc0cc000000007ddd0ccc700000000cc00cc00770000900cc0cc007700000000000000000000000000000000000
0000c7000c7000000007c0ddd70000000000c7000c7000000007d000c70000000000770077000000000077007700000000000000000000000000000000000000
00077700770000000000700070000000000777007700000000007000700000000007770777000000000777077700000000000000000000000000000000000000
__gff__
0001000000000000000000000000000000000101020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000151500141400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001000000000000000000000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001000000000000000000000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1101011111111111111111110101011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1212121212121212121212121212121200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1313131313131313131313131313131300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1313131313131313131313131313131300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000a00000c0501005010050100501005010050100501005010050100500e0500e0500e0500e050100500c0500c0500e0501005015050110501705013050150501705013050170501505010050100500e0500c050
