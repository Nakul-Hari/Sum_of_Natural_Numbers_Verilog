// Code your testbench here
// or browse Examples
module Testbench;
  reg [7:0] N;
  reg N_valid, Clk, Rst;
  wire [17:0] Sum;
  wire Sum_valid_out;
  
  Datapath DUT(N,N_valid,Sum,Sum_valid_out,Clk, Rst);
  
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(0, DUT);
    
    Clk = 0;
    forever #10 Clk = ~Clk;
  end
  
  initial begin
    Rst = 0;
    #10
    N_valid = 1;
    N = 5;
    #15
    Rst = 1;
    #10
    Rst = 0;
    #10
    N_valid = 1;
    #20
    N_valid = 0;
  end
  
  initial begin
    $monitor($time);
    #200
    $finish;
  end
endmodule

