module tb;
    reg [7:0] N; // input max size 1 byte
    reg N_valid;  //Input Qualifier
    reg Clk;
    wire [17:0] Sum_out; // output size 2 byte since input is 1 byte
    wire Sum_valid; //Output Qualifier

    Datapath DUT(N,N_valid,Sum_out,Sum_valid,Clk);
    initial
    begin
        $dumpfile("dump1.vcd");
        $dumpvars;
        N = 10;
        N_valid = 1;
        Clk = 1'b0;
        #25 N_valid = 0;
        #10 N = 5;
        #10000 $finish;
    end
    always #10 Clk = ~Clk;

endmodule
