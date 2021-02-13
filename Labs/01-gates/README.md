# LAB01 - Gates

## Link to my GitHub repository

https://github.com/xruine00/Digital-electronics-1

## De Morgan's laws

**Equations for the implementation of gates.**

![Logic functions](Images/equations.png)

The truth table:
| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

**Screenshot with time waveforms:**

![Time waveforms](Images/time_waveforms.PNG)

**Defined functions in VHDL:**
```vhdl
architecture dataflow of gates is
begin
    f_o     <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= ((not b_i) nand a_i) nand ((not c_i) nand (not b_i));
    fnor_o  <= (b_i nor (not a_i)) or (c_i nor b_i);

end architecture dataflow;
```

**Link to the EDA Playground:**

https://www.edaplayground.com/x/QuTC
