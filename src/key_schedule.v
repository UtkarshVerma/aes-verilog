`include "sbox"

// https://en.wikipedia.org/wiki/AES_key_schedule
// https://essenceia.github.io/projects/aes/
// https://www.youtube.com/watch?v=0RxLUf4fxs8
module key_schedule #(
    parameter int NUM_WORDS = 4
) (
    input [3:0] rc,
    input [31:0] key_current[NUM_WORDS],
    output [31:0] key_next[NUM_WORDS]
);
  localparam int BytesPerWord = 4;

  /* verilator lint_off UNOPTFLAT */
  wire [31:0] w_in[NUM_WORDS];
  wire [31:0] w_out[NUM_WORDS];
  wire [31:0] g_word;

  generate
    for (genvar i = 0; i < NUM_WORDS; ++i) begin : g_slice
      assign w_in[i] = key_current[i];
    end
  endgenerate

  g g_inst (
      .rc(rc),
      .word_in(w_in[NUM_WORDS-1]),
      .word_out(g_word)
  );
  assign w_out[0] = g_word ^ w_in[0];
  generate
    for (genvar i = 1; i < BytesPerWord; ++i) begin : g_schedule
      assign w_out[i] = w_out[i-1] ^ w_in[i];
    end
  endgenerate

  generate
    for (genvar i = 0; i < NUM_WORDS; ++i) begin : g_flatten
      assign key_next[i] = w_out[i];
    end
  endgenerate

  /* verilator lint_on UNOPTFLAT */
endmodule

module g (
    input  [ 3:0] rc,
    input  [31:0] word_in,
    output [31:0] word_out
);
  wire [31:0] shifted;
  wire [31:0] substituted;
  reg  [ 7:0] rcon_byte;

  // RotWord: 1 byte left circular shift.
  assign shifted = {word_in[7:0], word_in[31:8]};

  // SubWord: S-box substitution.
  generate
    for (genvar i = 0; i < 4; i = i + 1) begin : g_sub
      localparam int Lsb = 8 * i;

      sbox sbox_inst (
          .byte_in (shifted[Lsb+:8]),
          .byte_out(substituted[Lsb+:8])
      );
    end
  endgenerate

  // Rcon: XOR with round constant.
  assign word_out[7:0]  = substituted[7:0] ^ rc_i(rc);
  assign word_out[31:8] = substituted[31:8];
endmodule

function static [7:0] rc_i;
  input [3:0] i;

  // https://en.wikipedia.org/wiki/AES_key_schedule#Round_constants
  case (i)
    0: rc_i = 'h01;  // Round 1
    1: rc_i = 'h02;  // Round 2
    2: rc_i = 'h04;  // Round 3
    3: rc_i = 'h08;  // Round 4
    4: rc_i = 'h10;  // Round 5
    5: rc_i = 'h20;  // Round 6
    6: rc_i = 'h40;  // Round 7
    7: rc_i = 'h80;  // Round 8
    8: rc_i = 'h1b;  // Round 9
    9: rc_i = 'h36;  // Round 10
    default: rc_i = 'h00;
  endcase
endfunction

