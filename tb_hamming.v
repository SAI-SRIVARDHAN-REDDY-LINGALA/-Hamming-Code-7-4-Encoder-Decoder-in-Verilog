`timescale 1ns/1ps

module tb_hamming;

    reg  [3:0] data_in;
    reg  [2:0] error_inject_pos;

    wire [6:0] encoded_data;
    wire [6:0] received_data;
    wire       error_detected;
    wire [2:0] error_pos;
    wire [6:0] corrected_code;
    wire [3:0] data_out;

    hamming_top dut (
        .data_in(data_in),
        .error_inject_pos(error_inject_pos),
        .encoded_data(encoded_data),
        .recieved_data(received_data), // must match top module spelling
        .error_detected(error_detected),
        .error_pos(error_pos),
        .corrected_code(corrected_code),
        .data_out(data_out)
    );

    integer i;
    integer e;

    initial begin
        $display("==== HAMMING (7,4) TEST START ====");

        for (i = 0; i < 16; i = i + 1) begin
            data_in = i;

            // No error
            error_inject_pos = 3'd0;
            #10;
            $display("DATA=%b | NO ERROR | OUT=%b | PASS=%0d",
                     data_in, data_out, (data_out == data_in));

            // Single-bit errors
            for (e = 1; e <= 7; e = e + 1) begin
                error_inject_pos = e;
                #10;
                $display("DATA=%b | ERR_POS=%0d | DET=%b | CORR_POS=%0d | OUT=%b | PASS=%0d",
                         data_in,
                         error_inject_pos,
                         error_detected,
                         error_pos,
                         data_out,
                         (data_out == data_in));
            end
        end

        $display("==== TEST COMPLETE ====");
        $finish;
    end

endmodule
