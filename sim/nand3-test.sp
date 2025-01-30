* Simple NAND3_X1 simulation
* ------------------------------------------------------------------------

.param VDD='1.1V'
.temp  70
.inc   "/classes/ece6745/install/adks/freepdk-45nm/stdview/pdk-models.sp"
.inc   "/classes/ece6745/install/adks/freepdk-45nm/stdview/stdcells.spi"

* Instantiate a voltage supply, standard cell, and output load
* ------------------------------------------------------------------------

Vdd vdd gnd VDD

X1 a b c y vdd gnd NAND3_X1

Cload y gnd 70fF

* Instantiate three input sources
* ------------------------------------------------------------------------

A1 [a_ b_ c_] nand3_source
.model nand3_source d_source (input_file="nand3-source.txt")

Aa [a_] [a] dac_a
.model dac_a dac_bridge (out_low=0V out_high='VDD' t_rise=0.2ns t_fall=0.2ns)

Ab [b_] [b] dac_b
.model dac_b dac_bridge (out_low=0V out_high='VDD' t_rise=0.2ns t_fall=0.2ns)

Ac [c_] [c] dac_c
.model dac_c dac_bridge (out_low=0V out_high='VDD' t_rise=0.2ns t_fall=0.2ns)

* Run a simulation
* ------------------------------------------------------------------------

.ic   V(y)=VDD
.tran 0.01ns 4ns

.control
run
set color0=white
set color1=black
set color2=red
set xbrushwidth=2
plot V(a) V(b) V(c) V(y)
.endc

.end
