module hamming_top (
    input [3:0] data_in,
    input [2:0] error_inject_pos, 
    output [6:0] encoded_data ,
    output [6:0] recieved_data,
    output error_detected,
    output [2:0] error_pos,
    output [6:0] corrected_code,
    output [3:0] data_out 
);

wire [6:0] channel_data;//  before noise i.e encoded_data

//encoder insta

hamming_encoder enc (
    .data_in(data_in),
    .data_out(encoded_data)
);


//Adding noise at some pos
assign channel_data = (error_inject_pos == 0) ? encoded_data : encoded_data ^ (7'b1 << (error_inject_pos -1) ); 

assign recieved_data = channel_data ; 

//decoder insta 

hamming_decoder dec (
    .code_in(channel_data),
    .data_out(data_out),
    .error_pos(error_pos), 
    .error_detected(error_detected),
    .corrected_code(corrected_code)
 );

endmodule