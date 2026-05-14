module hamming_decoder ( //say 1 bit error 
    input [6:0] code_in ,
    output [3:0] data_out ,
    output [2:0] error_pos ,//since 7 positions 
    output error_detected , //flag
    output [6:0] corrected_code
);

wire d1,d2,d3,d4;
wire p1,p2,p3;
wire s1,s2,s3 ; 
wire [2:0] syndrome ; 
reg [6:0] corrected_code;

assign {d4,d3,d2,p3,d1,p2,p1} = code_in ; 

assign s1 = p1 ^ d1 ^ d2 ^ d4; //1,3,5,7
assign s2 = p2 ^ d1 ^ d3 ^ d4; //2,3,6,7
assign s3 = p3 ^ d2 ^ d3 ^ d4;  //4,5,6,7


assign syndrome = {s3,s2,s1}; //error position
assign error_pos = syndrome ; 
assign error_detected = (syndrome)? 1:0 ;


//correcting  // parity also can be errored 
always @(*) begin 
    corrected_code =code_in ;
    case(syndrome)
        3'b000 : corrected_code = code_in ; // no error 
        3'b001 : corrected_code = code_in  ^ 7'b0000001;
        3'b010 : corrected_code = code_in  ^ 7'b0000010;
        3'b011 : corrected_code = code_in ^ 7'b0000100;
        3'b100 : corrected_code = code_in ^ 7'b0001000;
        3'b101 : corrected_code = code_in ^ 7'b0010000;
        3'b110 : corrected_code = code_in ^ 7'b0100000;
        3'b111 : corrected_code = code_in ^ 7'b1000000;
        default : corrected_code = code_in;
    endcase 
end 

    assign data_out [0] = corrected_code[2];
    assign data_out [1] = corrected_code [4];
    assign data_out [2] = corrected_code[5];
    assign data_out [3] = corrected_code[6];


endmodule 