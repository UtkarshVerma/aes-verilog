module shift_rows #(
    parameter int N = 4
) (
    input clk,
    input [7:0] bytes_in[N][N],
    output [7:0] bytes_out[N][N]
);
  // Assume bytes to be stored in row-major.
  genvar i, j;
  generate
    for (i = 0; i < N; i = i + 1) begin : g_row
      for (j = 0; j < N; j = j + 1) begin : g_col
        assign bytes_out[i][j] = bytes_in[i][(i+j)%N];
      end
    end
  endgenerate
endmodule
