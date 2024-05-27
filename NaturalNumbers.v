



module Datapath(N,N_valid,Sum_out,Sum_valid,Clk);
  input [7:0] N;
  input N_valid , Clk;
  output reg [17:0] Sum_out;
  output reg Sum_valid ;
  wire[17:0] MUX_out, Add_out;
  reg[7:0] i;
  wire[7:0] i_new, N_new;
  wire Sum_valid_in;
  
  assign MUX_out = N_valid ? 18'b0 : Add_out ;

  always@(posedge Clk)
    begin
      	Sum_out <= MUX_out ;
    end

  assign Add_out = i + Sum_out;
  assign i_new = i - 1;
  assign N_new = N_valid ? N : i_new ;

  always@(posedge Clk)
    begin
      	i <= N_new ;
    end
  
  assign Sum_valid_in = (i == 8'b1);

  always@(posedge Clk)
    begin
      	Sum_valid <= Sum_valid_in ;
    end
  
endmodule
