`ifndef SBOX_V
`define SBOX_V

module sbox (
    input [7:0] byte_in,
    output reg [7:0] byte_out
);
  always @(byte_in) begin
    unique case (byte_in)
      8'h00: byte_out = 8'h63;
      8'h01: byte_out = 8'h7c;
      8'h02: byte_out = 8'h77;
      8'h03: byte_out = 8'h7b;
      8'h04: byte_out = 8'hf2;
      8'h05: byte_out = 8'h6b;
      8'h06: byte_out = 8'h6f;
      8'h07: byte_out = 8'hc5;
      8'h08: byte_out = 8'h30;
      8'h09: byte_out = 8'h01;
      8'h0a: byte_out = 8'h67;
      8'h0b: byte_out = 8'h2b;
      8'h0c: byte_out = 8'hfe;
      8'h0d: byte_out = 8'hd7;
      8'h0e: byte_out = 8'hab;
      8'h0f: byte_out = 8'h76;
      8'h10: byte_out = 8'hca;
      8'h11: byte_out = 8'h82;
      8'h12: byte_out = 8'hc9;
      8'h13: byte_out = 8'h7d;
      8'h14: byte_out = 8'hfa;
      8'h15: byte_out = 8'h59;
      8'h16: byte_out = 8'h47;
      8'h17: byte_out = 8'hf0;
      8'h18: byte_out = 8'had;
      8'h19: byte_out = 8'hd4;
      8'h1a: byte_out = 8'ha2;
      8'h1b: byte_out = 8'haf;
      8'h1c: byte_out = 8'h9c;
      8'h1d: byte_out = 8'ha4;
      8'h1e: byte_out = 8'h72;
      8'h1f: byte_out = 8'hc0;
      8'h20: byte_out = 8'hb7;
      8'h21: byte_out = 8'hfd;
      8'h22: byte_out = 8'h93;
      8'h23: byte_out = 8'h26;
      8'h24: byte_out = 8'h36;
      8'h25: byte_out = 8'h3f;
      8'h26: byte_out = 8'hf7;
      8'h27: byte_out = 8'hcc;
      8'h28: byte_out = 8'h34;
      8'h29: byte_out = 8'ha5;
      8'h2a: byte_out = 8'he5;
      8'h2b: byte_out = 8'hf1;
      8'h2c: byte_out = 8'h71;
      8'h2d: byte_out = 8'hd8;
      8'h2e: byte_out = 8'h31;
      8'h2f: byte_out = 8'h15;
      8'h30: byte_out = 8'h04;
      8'h31: byte_out = 8'hc7;
      8'h32: byte_out = 8'h23;
      8'h33: byte_out = 8'hc3;
      8'h34: byte_out = 8'h18;
      8'h35: byte_out = 8'h96;
      8'h36: byte_out = 8'h05;
      8'h37: byte_out = 8'h9a;
      8'h38: byte_out = 8'h07;
      8'h39: byte_out = 8'h12;
      8'h3a: byte_out = 8'h80;
      8'h3b: byte_out = 8'he2;
      8'h3c: byte_out = 8'heb;
      8'h3d: byte_out = 8'h27;
      8'h3e: byte_out = 8'hb2;
      8'h3f: byte_out = 8'h75;
      8'h40: byte_out = 8'h09;
      8'h41: byte_out = 8'h83;
      8'h42: byte_out = 8'h2c;
      8'h43: byte_out = 8'h1a;
      8'h44: byte_out = 8'h1b;
      8'h45: byte_out = 8'h6e;
      8'h46: byte_out = 8'h5a;
      8'h47: byte_out = 8'ha0;
      8'h48: byte_out = 8'h52;
      8'h49: byte_out = 8'h3b;
      8'h4a: byte_out = 8'hd6;
      8'h4b: byte_out = 8'hb3;
      8'h4c: byte_out = 8'h29;
      8'h4d: byte_out = 8'he3;
      8'h4e: byte_out = 8'h2f;
      8'h4f: byte_out = 8'h84;
      8'h50: byte_out = 8'h53;
      8'h51: byte_out = 8'hd1;
      8'h52: byte_out = 8'h00;
      8'h53: byte_out = 8'hed;
      8'h54: byte_out = 8'h20;
      8'h55: byte_out = 8'hfc;
      8'h56: byte_out = 8'hb1;
      8'h57: byte_out = 8'h5b;
      8'h58: byte_out = 8'h6a;
      8'h59: byte_out = 8'hcb;
      8'h5a: byte_out = 8'hbe;
      8'h5b: byte_out = 8'h39;
      8'h5c: byte_out = 8'h4a;
      8'h5d: byte_out = 8'h4c;
      8'h5e: byte_out = 8'h58;
      8'h5f: byte_out = 8'hcf;
      8'h60: byte_out = 8'hd0;
      8'h61: byte_out = 8'hef;
      8'h62: byte_out = 8'haa;
      8'h63: byte_out = 8'hfb;
      8'h64: byte_out = 8'h43;
      8'h65: byte_out = 8'h4d;
      8'h66: byte_out = 8'h33;
      8'h67: byte_out = 8'h85;
      8'h68: byte_out = 8'h45;
      8'h69: byte_out = 8'hf9;
      8'h6a: byte_out = 8'h02;
      8'h6b: byte_out = 8'h7f;
      8'h6c: byte_out = 8'h50;
      8'h6d: byte_out = 8'h3c;
      8'h6e: byte_out = 8'h9f;
      8'h6f: byte_out = 8'ha8;
      8'h70: byte_out = 8'h51;
      8'h71: byte_out = 8'ha3;
      8'h72: byte_out = 8'h40;
      8'h73: byte_out = 8'h8f;
      8'h74: byte_out = 8'h92;
      8'h75: byte_out = 8'h9d;
      8'h76: byte_out = 8'h38;
      8'h77: byte_out = 8'hf5;
      8'h78: byte_out = 8'hbc;
      8'h79: byte_out = 8'hb6;
      8'h7a: byte_out = 8'hda;
      8'h7b: byte_out = 8'h21;
      8'h7c: byte_out = 8'h10;
      8'h7d: byte_out = 8'hff;
      8'h7e: byte_out = 8'hf3;
      8'h7f: byte_out = 8'hd2;
      8'h80: byte_out = 8'hcd;
      8'h81: byte_out = 8'h0c;
      8'h82: byte_out = 8'h13;
      8'h83: byte_out = 8'hec;
      8'h84: byte_out = 8'h5f;
      8'h85: byte_out = 8'h97;
      8'h86: byte_out = 8'h44;
      8'h87: byte_out = 8'h17;
      8'h88: byte_out = 8'hc4;
      8'h89: byte_out = 8'ha7;
      8'h8a: byte_out = 8'h7e;
      8'h8b: byte_out = 8'h3d;
      8'h8c: byte_out = 8'h64;
      8'h8d: byte_out = 8'h5d;
      8'h8e: byte_out = 8'h19;
      8'h8f: byte_out = 8'h73;
      8'h90: byte_out = 8'h60;
      8'h91: byte_out = 8'h81;
      8'h92: byte_out = 8'h4f;
      8'h93: byte_out = 8'hdc;
      8'h94: byte_out = 8'h22;
      8'h95: byte_out = 8'h2a;
      8'h96: byte_out = 8'h90;
      8'h97: byte_out = 8'h88;
      8'h98: byte_out = 8'h46;
      8'h99: byte_out = 8'hee;
      8'h9a: byte_out = 8'hb8;
      8'h9b: byte_out = 8'h14;
      8'h9c: byte_out = 8'hde;
      8'h9d: byte_out = 8'h5e;
      8'h9e: byte_out = 8'h0b;
      8'h9f: byte_out = 8'hdb;
      8'ha0: byte_out = 8'he0;
      8'ha1: byte_out = 8'h32;
      8'ha2: byte_out = 8'h3a;
      8'ha3: byte_out = 8'h0a;
      8'ha4: byte_out = 8'h49;
      8'ha5: byte_out = 8'h06;
      8'ha6: byte_out = 8'h24;
      8'ha7: byte_out = 8'h5c;
      8'ha8: byte_out = 8'hc2;
      8'ha9: byte_out = 8'hd3;
      8'haa: byte_out = 8'hac;
      8'hab: byte_out = 8'h62;
      8'hac: byte_out = 8'h91;
      8'had: byte_out = 8'h95;
      8'hae: byte_out = 8'he4;
      8'haf: byte_out = 8'h79;
      8'hb0: byte_out = 8'he7;
      8'hb1: byte_out = 8'hc8;
      8'hb2: byte_out = 8'h37;
      8'hb3: byte_out = 8'h6d;
      8'hb4: byte_out = 8'h8d;
      8'hb5: byte_out = 8'hd5;
      8'hb6: byte_out = 8'h4e;
      8'hb7: byte_out = 8'ha9;
      8'hb8: byte_out = 8'h6c;
      8'hb9: byte_out = 8'h56;
      8'hba: byte_out = 8'hf4;
      8'hbb: byte_out = 8'hea;
      8'hbc: byte_out = 8'h65;
      8'hbd: byte_out = 8'h7a;
      8'hbe: byte_out = 8'hae;
      8'hbf: byte_out = 8'h08;
      8'hc0: byte_out = 8'hba;
      8'hc1: byte_out = 8'h78;
      8'hc2: byte_out = 8'h25;
      8'hc3: byte_out = 8'h2e;
      8'hc4: byte_out = 8'h1c;
      8'hc5: byte_out = 8'ha6;
      8'hc6: byte_out = 8'hb4;
      8'hc7: byte_out = 8'hc6;
      8'hc8: byte_out = 8'he8;
      8'hc9: byte_out = 8'hdd;
      8'hca: byte_out = 8'h74;
      8'hcb: byte_out = 8'h1f;
      8'hcc: byte_out = 8'h4b;
      8'hcd: byte_out = 8'hbd;
      8'hce: byte_out = 8'h8b;
      8'hcf: byte_out = 8'h8a;
      8'hd0: byte_out = 8'h70;
      8'hd1: byte_out = 8'h3e;
      8'hd2: byte_out = 8'hb5;
      8'hd3: byte_out = 8'h66;
      8'hd4: byte_out = 8'h48;
      8'hd5: byte_out = 8'h03;
      8'hd6: byte_out = 8'hf6;
      8'hd7: byte_out = 8'h0e;
      8'hd8: byte_out = 8'h61;
      8'hd9: byte_out = 8'h35;
      8'hda: byte_out = 8'h57;
      8'hdb: byte_out = 8'hb9;
      8'hdc: byte_out = 8'h86;
      8'hdd: byte_out = 8'hc1;
      8'hde: byte_out = 8'h1d;
      8'hdf: byte_out = 8'h9e;
      8'he0: byte_out = 8'he1;
      8'he1: byte_out = 8'hf8;
      8'he2: byte_out = 8'h98;
      8'he3: byte_out = 8'h11;
      8'he4: byte_out = 8'h69;
      8'he5: byte_out = 8'hd9;
      8'he6: byte_out = 8'h8e;
      8'he7: byte_out = 8'h94;
      8'he8: byte_out = 8'h9b;
      8'he9: byte_out = 8'h1e;
      8'hea: byte_out = 8'h87;
      8'heb: byte_out = 8'he9;
      8'hec: byte_out = 8'hce;
      8'hed: byte_out = 8'h55;
      8'hee: byte_out = 8'h28;
      8'hef: byte_out = 8'hdf;
      8'hf0: byte_out = 8'h8c;
      8'hf1: byte_out = 8'ha1;
      8'hf2: byte_out = 8'h89;
      8'hf3: byte_out = 8'h0d;
      8'hf4: byte_out = 8'hbf;
      8'hf5: byte_out = 8'he6;
      8'hf6: byte_out = 8'h42;
      8'hf7: byte_out = 8'h68;
      8'hf8: byte_out = 8'h41;
      8'hf9: byte_out = 8'h99;
      8'hfa: byte_out = 8'h2d;
      8'hfb: byte_out = 8'h0f;
      8'hfc: byte_out = 8'hb0;
      8'hfd: byte_out = 8'h54;
      8'hfe: byte_out = 8'hbb;
      8'hff: byte_out = 8'h16;
    endcase
  end
endmodule

`endif
