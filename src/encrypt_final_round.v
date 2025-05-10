`include "add_round_key"
`include "key_schedule"
`include "mix_columns"
`include "sbox"
`include "shift_rows"
`include "sub_bytes"

module encrypt_final_round #(
    parameter int N = 4,
    localparam int KeySize = N * N * 8
) (
    input [7:0] state_in[N][N],
    input [KeySize - 1:0] key,
    output [7:0] cipher_text[N][N]
);
  wire [7:0] state_sboxed [N][N];
  wire [7:0] state_shifted[N][N];

  sub_bytes #(
      .N(N)
  ) sb (
      .state_in (state_in),
      .state_out(state_sboxed)
  );

  shift_rows #(
      .N(N)
  ) sr (
      .state_in (state_sboxed),
      .state_out(state_shifted)
  );

  add_round_key #(
      .N(N)
  ) ark (
      .state_in(state_shifted),
      .key(key),
      .state_out(cipher_text)
  );
endmodule
