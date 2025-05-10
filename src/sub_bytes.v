`include "sbox"

module sub_bytes #(
    parameter int N = 4
) (
    input  [7:0] state_in [N][N],
    output [7:0] state_out[N][N]
);
  generate
    for (genvar i = 0; i < N; i++) begin : g_row
      for (genvar j = 0; j < N; j++) begin : g_column
        sbox sbox_inst (
            .byte_in (state_in[i][j]),
            .byte_out(state_out[i][j])
        );
      end
    end
  endgenerate
endmodule
