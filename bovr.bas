10 MEMORY &3000-1
30 LOAD"BOVR.BIN"
35 CALL &3000
40 |LARGE
50 |CLS
60 FOR y%=0 TO 2047
70 |POKE,y%,&ff
80 NEXT y%
81 FOR y%=16384 TO 16384+2047
82 |POKE,y%,&ff
83 NEXT y%
90 |POKE,5000,&ff
100 |POKE,5000+2048,&ff
999 IF INKEY$="" THEN 999
1000 |STD
1010 END

