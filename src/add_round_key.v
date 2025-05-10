module add_round_key #(
    parameter int N = 4,
    localparam int KeySize = N * N * 8
) (
    input [KeySize - 1:0] key,
    input [7:0] state_in[N][N],
    output [7:0] state_out[N][N]
);
  generate
    for (genvar i = 0; i < N; i = i + 1) begin : g_row
      for (genvar j = 0; j < N; j = j + 1) begin : g_col
        assign state_out[i][j] = state_in[i][j] ^ key[8*(i*N+j)+:8];
      end
    end
  endgenerate
endmodule
