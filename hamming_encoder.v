module hamming_encoder (
    input [3:0]data_in ,
    output [6:0] data_out // since 3 parity bits 
);

wire d1 = data_in[0];
wire d2 = data_in[1];
wire d3 = data_in[2];
wire d4 = data_in[3];

wire p1,p2,p3 ; // or wire [2:0] p;

assign data_out = { d4,d3,d2,p3,d1,p2,p1};

// in sums we actaully write reverse so dont confuse 
// and we use different names 



//even parity 
assign p1 = d1 ^ d2 ^ d4 ; //1,3,5,7 positions in data out 
assign p2 = d1 ^ d3 ^ d4 ; // 2,3,6,7
assign p3 = d2 ^ d3 ^ d4 ; // 4,5,6,7 (bcz 3 bit from lsb = 1 )
 


endmodule


// module tb;

//     reg [3:0] data_in;
//     wire [6:0] data_out;

//     hamming_encoder dut(data_in, data_out);

//     initial begin
//         data_in = 4'b1101;
//         #1;
//         $display("the value of data_out is %b",data_out);
//     end

// endmodule

