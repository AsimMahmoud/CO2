module ALU (ALU_result,zero,data_in_1,data_in_2,func,ALUOp);
input [5:0] func;
input [31:0] data_in_1;
input [31:0] data_in_2;
input [1:0] ALUOp;
output [31:0] ALU_result;
output zero;

reg [31:0] ALU_result;
reg zero;
parameter [5:0]
	add = 6'b100000, // 32
	AND = 6'b100100, // 36
	NOR = 6'b100111, // 39
	OR  = 6'b100101, // 37
	sll = 6'b000000, // 0
	slt = 6'b101010, // 42
	sub = 6'b100010; // 34
parameter [1:0]
	add_lw_sw = 2'b00,
	sub_beq   = 2'b01,
	functions = 2'b10;

always@(ALUOp) begin
	if (ALUOp == add_lw_sw)begin
		assign ALU_result = data_in_1 + data_in_2;
	end

	else if (ALUOp == sub_beq)begin
		if (data_in_1 == data_in_2)begin
			zero = 1 ;
		end
	        else begin
			zero = 0 ;
		end
	end
	else if (ALUOp == functions) begin
		case (func)
			add : begin
				assign ALU_result = data_in_1 + data_in_2;
			      end
			AND : begin
                                assign ALU_result = data_in_1 & data_in_2;
			      end
			NOR : begin
				assign ALU_result = data_in_1 ~^ data_in_2;
			      end
			OR  : begin
				assign ALU_result = data_in_1 | data_in_2;
			      end
			sll : begin
				assign ALU_result = data_in_1 << data_in_2;
			      end
			slt : begin
				if (data_in_1 < data_in_2)begin
					assign ALU_result = 1;
				end else 
				begin
					assign ALU_result = 0;
				end
			      end
			sub : begin
				assign ALU_result = data_in_1 - data_in_2;
			      end
		endcase
	end
end

endmodule
