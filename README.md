# Digital-electronics-1

## Krátký popis
Tento repozitář *Digitální elektronika* je určen pro **všechny soubory** týkající se tohoto předmětu.

## Co se naučíme?
* Základy digitálních obvodů a kombinační logiky
* Principy sekvenčních obvodů a konečných automatů
* Psaní kódu ve VHDL
* Navrhování testbench ve VHDL
* Navrhování obvodů pro FPGA

## Odkaz na Moodle
[BPC-DE1](https://moodle.vutbr.cz/course/view.php?id=224131)

## Tabulka OR
 a | b  | f(a,b)
-- | -- | --
0 | 0 | 0
0 | 1 | 1
1 | 0 | 1
1 | 1 | 1

## VHDL kód
```vhdl
entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        for_o  : out std_logic;         -- OR output function
        fand_o : out std_logic;         -- AND output function
        fxor_o : out std_logic          -- XOR output function
    );
end entity gates;
```

|              | Header 1        | Header 2                       || Header 3                       ||
|              | Subheader 1     | Subheader 2.1  | Subheader 2.2  | Subheader 3.1  | Subheader 3.2  |
|==============|-----------------|----------------|----------------|----------------|----------------|
| Row Header 1 | 3row, 3col span                                 ||| Colspan only                   ||
| Row Header 2 |       ^                                         ||| Rowspan only   | Cell           |
| Row Header 3 |       ^                                         |||       ^        | Cell           |
| Row Header 4 |  Row            |  Each cell     |:   Centered   :| Right-aligned :|: Left-aligned  |
:              :  with multiple  :  has room for  :   multi-line   :    multi-line  :  multi-line    :
:              :  lines.         :  more text.    :      text.     :         text.  :  text.         :
|--------------|-----------------|----------------|----------------|----------------|----------------|
