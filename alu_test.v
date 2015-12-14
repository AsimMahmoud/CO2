module test_alu();
reg  [5:0] func;
reg  [31:0] data_in_1;
reg  [31:0] data_in_2;
reg  [1:0] ALUOp;
wire [31:0] ALU_result_test;
wire zero;
ALU test_1(ALU_result_test,zero,data_in_1,data_in_2,func,ALUOp);

initial begin
$monitor (ALU_result_test,zero,data_in_1,data_in_2,func,ALUOp);
 
ALUOp = 0; // put data here to test 
func = 34;
data_in_1 = 12;
data_in_2 = 4;
end
endmodule


