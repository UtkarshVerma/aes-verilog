`include "mix_column"

// https://en.wikipedia.org/wiki/Rijndael_MixColumns
module mix_columns #(
    parameter int N = 4
) (
    input  [7:0] state_in [N][N],
    output [7:0] state_out[N][N]
);
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : g_mix_column
      mix_column #(
          .N(N)
      ) mc (
          .column_in (state_in[i]),
          .column_out(state_out[i])
      );
    end
  endgenerate
endmodule
