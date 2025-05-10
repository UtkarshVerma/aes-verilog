module sub_bytes #(
    parameter int N = 4
) (
    input  [7:0] bytes_in [N][N],
    output [7:0] bytes_out[N][N]
);
  // Assume bytes are stored row-major.
  genvar i, j;
  generate
    for (i = 0; i < N; i++) begin : g_row
      for (j = 0; j < N; j++) begin : g_column
        sbox sbox_inst (
            .byte_in (bytes_in[i][j]),
            .byte_out(bytes_out[i][j])
        );
      end
    end
  endgenerate
endmodule
