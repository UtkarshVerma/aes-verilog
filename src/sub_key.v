module sub_key #(
    parameter int KEY_SIZE = 128
) (
    input  [KEY_SIZE-1:0] key_in,
    input  [KEY_SIZE-1:0] mc_sr_out,
    output [KEY_SIZE-1:0] data_out
);
  assign data_out = key_in ^ mc_sr_out;
endmodule
