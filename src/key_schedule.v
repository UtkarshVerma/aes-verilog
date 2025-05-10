`include "sbox"

// https://en.wikipedia.org/wiki/AES_key_schedule
// https://essenceia.github.io/projects/aes/
// https://www.youtube.com/watch?v=0RxLUf4fxs8
module key_schedule #(
    parameter int KeySize = 128
) (
    input [3:0] rc,
    input [KeySize-1:0] key_current,
    output [KeySize-1:0] key_next
);
  localparam int BytesPerWord = 4;
  localparam int N = KeySize / (BytesPerWord * 8);

  wire [31:0] w_in[N];
  /* verilator lint_off UNOPTFLAT */
  wire [31:0] w_out[N];
  /* verilator lint_on UNOPTFLAT */
  wire [31:0] g_word;

  generate
    for (genvar i = 0; i < N; i = i + 1) begin : g_slice
      assign w_in[i] = key_current[32*(i+1)-1:32*i];
    end
  endgenerate

  g g_inst (
      .rc(rc),
      .word_in(w_in[N-1]),
      .word_out(g_word)
  );
  assign w_out[0] = g_word ^ w_in[0];
  generate
    for (genvar i = 1; i < BytesPerWord; i = i + 1) begin : g_schedule
      assign w_out[i] = w_out[i-1] ^ w_in[i];
    end
  endgenerate

  generate
    for (genvar i = 0; i < N; i = i + 1) begin : g_flatten
      assign key_next[32*(i+1)-1:32*i] = w_out[i];
    end
  endgenerate
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
  assign shifted = {word_in[23:0], word_in[31:24]};

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
  assign word_out[31:24] = substituted[31:24] ^ rc_i(rc);
  assign word_out[23:0]  = substituted[23:0];
endmodule

function static [7:0] rc_i;
  input [3:0] i;

  // https://en.wikipedia.org/wiki/AES_key_schedule#Round_constants
  case (i)
    0: rc_i = 'h01;
    1: rc_i = 'h02;
    2: rc_i = 'h04;
    3: rc_i = 'h08;
    4: rc_i = 'h10;
    5: rc_i = 'h20;
    6: rc_i = 'h40;
    7: rc_i = 'h80;
    8: rc_i = 'h1b;
    9: rc_i = 'h36;
    default: rc_i = 'h00;
  endcase
endfunction
