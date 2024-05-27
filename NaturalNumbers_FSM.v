

module Datapath(N,N_valid,Sum,Sum_valid_out,Clk,Rst);
  input [7:0] N;
  input N_valid , Clk, Rst;
  reg [17:0] Sum_out;
  output [17:0] Sum;
  output Sum_valid_out;
  reg Sum_valid ;
  wire[17:0] MUX_out, Add_out;
  reg[7:0] i;
  wire[7:0] i_new, N_new;
  wire Sum_valid_in, i_eq_1, Rst;
  wire [1:0] State_out;
  wire [1:0] MUX_sel;

  FSM F0(State_out, N_valid, i_eq_1, Sum_valid_out, Clk, Rst);


  assign i_eq_1 = (i == 1);
  assign Sum = Sum_out;
  assign MUX_out = MUX_sel ? 18'b0 : Add_out ;
  assign MUX_sel = (State_out == 2'b00);

  always @ (posedge Clk)
    begin
    if(Rst)
	begin
	Sum_out <=  0 ;
	i <= 0 ;
	end
    else
	begin
      	Sum_out <= MUX_out ;
	i <= N_new ;
        end
    end

  assign Add_out = i + Sum_out;
  assign i_new = i - 1;
  assign N_new = MUX_sel ? N : i_new ;

 
  
  assign Sum_valid_in = (i == 8'b1);


  assign Sum_valid_out = (State_out==2'b10);



endmodule



module FSM(State_out,N_valid, i_eq_1, Sum_valid, Clk, Rst);
input N_valid, i_eq_1, Clk, Rst;
output Sum_valid;
output [1:0] State_out;
reg [1:0] State;
reg [1:0] State_next;

parameter Idle = 2'b00;
parameter Busy = 2'b01;
parameter Done = 2'b10;


 always@(posedge Clk)   //Idle = 0 , Busy = 1 , Done = 2
	if(Rst) State <= Idle;
	else State <= State_next;

always@(*)
case(State)
 Idle: if (N_valid) State_next = Busy; else State_next = Idle;
 Busy: if (i_eq_1) State_next = Done; else State_next = Busy;
 Done: State_next = Idle;
endcase

assign State_out=State;

endmodule	
