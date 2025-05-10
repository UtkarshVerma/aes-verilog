module shift_rows #(
    parameter int N = 4
) (
    input  [7:0] state_in [N][N],
    output [7:0] state_out[N][N]
);
  // Assume bytes to be stored in row-major.
  genvar i, j;
  generate
    for (i = 0; i < N; i = i + 1) begin : g_row
      for (j = 0; j < N; j = j + 1) begin : g_col
        assign state_out[i][j] = state_in[i][(i+j)%N];
      end
    end
  endgenerate
endmodule
