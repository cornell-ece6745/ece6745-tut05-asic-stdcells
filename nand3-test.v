
`include "/classes/ece6745/install/adks/freepdk-45nm/stdview/stdcells.v"

module top();

  logic a;
  logic b;
  logic c;
  logic y;

  NAND3_X1 nand3( a, b, c, y );

  initial begin
    $dumpfile("nand3-test.vcd");
    $dumpvars;

    a = 0; b = 0; c = 0;
    #10;
    $display( "a=%b, b=%b, c=%b, y=%b", a, b, c, y );

    a = 1; b = 1; c = 1;
    #10;
    $display( "a=%b, b=%b, c=%b, y=%b", a, b, c, y );

    a = 0; b = 1; c = 0;
    #10;
    $display( "a=%b, b=%b, c=%b, y=%b", a, b, c, y );

    a = 1; b = 1; c = 1;
    #10;
    $display( "a=%b, b=%b, c=%b, y=%b", a, b, c, y );

  end

endmodule

