`include "add_round_key"
`include "key_schedule"
`include "mix_columns"
`include "sbox"
`include "shift_rows"
`include "sub_bytes"

module encrypt_middle_round #(
    parameter int N = 4,
    localparam int KeySize = N * N * 8
) (
    input [3:0] round,
    input [KeySize - 1:0] key,
    input [7:0] state_in[N][N],
    output [7:0] state_out[N][N],
    output [KeySize - 1:0] key_next
);
  wire [7:0] state_sboxed [N][N];
  wire [7:0] state_shifted[N][N];
  wire [7:0] state_mixed  [N][N];
  wire [7:0] state_final  [N][N];

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

  mix_columns #(
      .N(N)
  ) mc (
      .state_in (state_shifted),
      .state_out(state_mixed)
  );

  add_round_key #(
      .N(N)
  ) ark (
      .state_in(state_final),
      .key(key),
      .state_out(state_out)
  );

  key_schedule #(
      .KeySize(KeySize)
  ) ks (
      .rc(round),
      .key_current(key),
      .key_next(key_next)
  );

  // Only add the round key in the first round.
  assign state_final = (round == 0) ? state_in : state_mixed;
endmodule
