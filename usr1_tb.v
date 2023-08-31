`timescale 1ns / 1ps
module usr1_tb;
  reg clk, rst_n;
  reg [1:0] select;
  reg [3:0] p_din;
  reg s_left_din, s_right_din;
  wire [3:0] p_dout; //parallel data out
  wire s_left_dout, s_right_dout;
  usr uut(clk, rst_n, select, p_din, s_left_din, s_right_din, p_dout, s_left_dout, s_right_dout);
  always #2 clk = ~clk;
  initial begin
     clk = 0; rst_n = 0;
    #3 rst_n = 1;
    p_din = 4'b1101;
    s_left_din = 1'b1;
    s_right_din = 1'b0;
    select = 2'h3; #10;
    select = 2'h1; #20;
    p_din = 4'b1101;
    select = 2'h3; #10; 
    select = 2'h2; #20;
    select = 2'h0; #20;
    end
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
   endmodule
  
    
  
