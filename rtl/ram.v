module ram(
  input wire clk,
  input wire reset,
  input wire [7:0] addr,
  input wire we,               // Write Enable (write if we is high else read)
  input wire oe,               // Enable Output
  inout wire [7:0] data,

  input wire bup,
  input wire bdown, 
  input wire bleft,
  input wire bright,

  output wire [7:0] led_row,
  output wire [7:0] led_col
  
);
  integer i;
  reg [7:0] mem [0:255];
  reg [7:0] buffer;

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      buffer = 8'b0;

 mem[0] <= 8'h00;
mem[1] <= 8'h00;
mem[2] <= 8'h00;
mem[3] <= 8'h00;
mem[4] <= 8'h00;
mem[5] <= 8'h00;
mem[6] <= 8'h00;
mem[7] <= 8'h00;
mem[8] <= 8'h00;
mem[9] <= 8'h10;
mem[10] <= 8'h00;
mem[11] <= 8'h11;
mem[12] <= 8'h00;
mem[13] <= 8'h10;
mem[14] <= 8'h00;
mem[15] <= 8'h87;
mem[16] <= 8'h40;
mem[17] <= 8'h11;
mem[18] <= 8'h01;
mem[19] <= 8'h06;
mem[20] <= 8'h19;
mem[21] <= 8'h24;
mem[22] <= 8'h40;
mem[23] <= 8'h11;
mem[24] <= 8'h02;
mem[25] <= 8'h06;
mem[26] <= 8'h19;
mem[27] <= 8'h47;
mem[28] <= 8'h40;
mem[29] <= 8'h11;
mem[30] <= 8'h03;
mem[31] <= 8'h06;
mem[32] <= 8'h19;
mem[33] <= 8'h6a;
mem[34] <= 8'h18;
mem[35] <= 8'h0d;
mem[36] <= 8'h10;
mem[37] <= 8'h00;
mem[38] <= 8'hb8;
mem[39] <= 8'h01;
mem[40] <= 8'h10;
mem[41] <= 8'h18;
mem[42] <= 8'hb8;
mem[43] <= 8'h02;
mem[44] <= 8'h10;
mem[45] <= 8'h24;
mem[46] <= 8'hb8;
mem[47] <= 8'h03;
mem[48] <= 8'h10;
mem[49] <= 8'h42;
mem[50] <= 8'hb8;
mem[51] <= 8'h04;
mem[52] <= 8'h10;
mem[53] <= 8'h7e;
mem[54] <= 8'hb8;
mem[55] <= 8'h05;
mem[56] <= 8'h10;
mem[57] <= 8'h42;
mem[58] <= 8'hb8;
mem[59] <= 8'h06;
mem[60] <= 8'h10;
mem[61] <= 8'h42;
mem[62] <= 8'hb8;
mem[63] <= 8'h07;
mem[64] <= 8'h10;
mem[65] <= 8'h00;
mem[66] <= 8'hb8;
mem[67] <= 8'h08;
mem[68] <= 8'h11;
mem[69] <= 8'h01;
mem[70] <= 8'h02;
mem[71] <= 8'h10;
mem[72] <= 8'h00;
mem[73] <= 8'hb8;
mem[74] <= 8'h01;
mem[75] <= 8'h10;
mem[76] <= 8'h0e;
mem[77] <= 8'hb8;
mem[78] <= 8'h02;
mem[79] <= 8'h10;
mem[80] <= 8'h10;
mem[81] <= 8'hb8;
mem[82] <= 8'h03;
mem[83] <= 8'h10;
mem[84] <= 8'h20;
mem[85] <= 8'hb8;
mem[86] <= 8'h04;
mem[87] <= 8'h10;
mem[88] <= 8'h20;
mem[89] <= 8'hb8;
mem[90] <= 8'h05;
mem[91] <= 8'h10;
mem[92] <= 8'h10;
mem[93] <= 8'hb8;
mem[94] <= 8'h06;
mem[95] <= 8'h10;
mem[96] <= 8'h0e;
mem[97] <= 8'hb8;
mem[98] <= 8'h07;
mem[99] <= 8'h10;
mem[100] <= 8'h00;
mem[101] <= 8'hb8;
mem[102] <= 8'h08;
mem[103] <= 8'h11;
mem[104] <= 8'h02;
mem[105] <= 8'h02;
mem[106] <= 8'h10;
mem[107] <= 8'h00;
mem[108] <= 8'hb8;
mem[109] <= 8'h01;
mem[110] <= 8'h10;
mem[111] <= 8'h42;
mem[112] <= 8'hb8;
mem[113] <= 8'h02;
mem[114] <= 8'h10;
mem[115] <= 8'h66;
mem[116] <= 8'hb8;
mem[117] <= 8'h03;
mem[118] <= 8'h10;
mem[119] <= 8'h5a;
mem[120] <= 8'hb8;
mem[121] <= 8'h04;
mem[122] <= 8'h10;
mem[123] <= 8'h42;
mem[124] <= 8'hb8;
mem[125] <= 8'h05;
mem[126] <= 8'h10;
mem[127] <= 8'h42;
mem[128] <= 8'hb8;
mem[129] <= 8'h06;
mem[130] <= 8'h10;
mem[131] <= 8'h42;
mem[132] <= 8'hb8;
mem[133] <= 8'h07;
mem[134] <= 8'h10;
mem[135] <= 8'h00;
mem[136] <= 8'hb8;
mem[137] <= 8'h08;
mem[138] <= 8'h11;
mem[139] <= 8'h03;
mem[140] <= 8'h02;
mem[141] <= 8'h00;
mem[142] <= 8'h00;
mem[143] <= 8'h00;
mem[144] <= 8'h00;
mem[145] <= 8'h00;
mem[146] <= 8'h00;
mem[147] <= 8'h00;
mem[148] <= 8'h00;
mem[149] <= 8'h00;
mem[150] <= 8'h00;
mem[151] <= 8'h00;
mem[152] <= 8'h00;
mem[153] <= 8'h00;
mem[154] <= 8'h00;
mem[155] <= 8'h00;
mem[156] <= 8'h00;
mem[157] <= 8'h00;
mem[158] <= 8'h00;
mem[159] <= 8'h00;
mem[160] <= 8'h00;
mem[161] <= 8'h00;
mem[162] <= 8'h00;
mem[163] <= 8'h00;
mem[164] <= 8'h00;
mem[165] <= 8'h00;
mem[166] <= 8'h00;
mem[167] <= 8'h00;
mem[168] <= 8'h00;
mem[169] <= 8'h00;
mem[170] <= 8'h00;
mem[171] <= 8'h00;
mem[172] <= 8'h00;
mem[173] <= 8'h00;
mem[174] <= 8'h00;
mem[175] <= 8'h00;
mem[176] <= 8'h00;
mem[177] <= 8'h00;
mem[178] <= 8'h00;
mem[179] <= 8'h00;
mem[180] <= 8'h00;
mem[181] <= 8'h00;
mem[182] <= 8'h00;
mem[183] <= 8'h00;
mem[184] <= 8'h00;
mem[185] <= 8'h00;
mem[186] <= 8'h00;
mem[187] <= 8'h00;
mem[188] <= 8'h00;
mem[189] <= 8'h00;
mem[190] <= 8'h00;
mem[191] <= 8'h00;
mem[192] <= 8'h00;
mem[193] <= 8'h00;
mem[194] <= 8'h00;
mem[195] <= 8'h00;
mem[196] <= 8'h00;
mem[197] <= 8'h00;
mem[198] <= 8'h00;
mem[199] <= 8'h00;
mem[200] <= 8'h00;
mem[201] <= 8'h00;
mem[202] <= 8'h00;
mem[203] <= 8'h00;
mem[204] <= 8'h00;
mem[205] <= 8'h00;
mem[206] <= 8'h00;
mem[207] <= 8'h00;
mem[208] <= 8'h00;
mem[209] <= 8'h00;
mem[210] <= 8'h00;
mem[211] <= 8'h00;
mem[212] <= 8'h00;
mem[213] <= 8'h00;
mem[214] <= 8'h00;
mem[215] <= 8'h00;
mem[216] <= 8'h00;
mem[217] <= 8'h00;
mem[218] <= 8'h00;
mem[219] <= 8'h00;
mem[220] <= 8'h00;
mem[221] <= 8'h00;
mem[222] <= 8'h00;
mem[223] <= 8'h00;
mem[224] <= 8'h00;
mem[225] <= 8'h00;
mem[226] <= 8'h00;
mem[227] <= 8'h00;
mem[228] <= 8'h00;
mem[229] <= 8'h00;
mem[230] <= 8'h00;
mem[231] <= 8'h00;
mem[232] <= 8'h00;
mem[233] <= 8'h00;
mem[234] <= 8'h00;
mem[235] <= 8'h00;
mem[236] <= 8'h00;
mem[237] <= 8'h00;
mem[238] <= 8'h00;
mem[239] <= 8'h00;
mem[240] <= 8'h00;
mem[241] <= 8'h00;
mem[242] <= 8'h00;
mem[243] <= 8'h00;
mem[244] <= 8'h00;
mem[245] <= 8'h00;
mem[246] <= 8'h00;
mem[247] <= 8'h00;
mem[248] <= 8'h00;
mem[249] <= 8'h00;
mem[250] <= 8'h00;
mem[251] <= 8'h00;
mem[252] <= 8'h00;
mem[253] <= 8'h00;
mem[254] <= 8'h00;
mem[255] <= 8'h00;


    end else begin
    if (we) begin
      mem[addr] <= data;
//      $display("Memory: set [0x%h] => 0x%h (%d)", addr, data, data);
    end else begin
      buffer <= mem[addr];
    end
  end
  end

  assign data = (oe & ~we) ? buffer : 'bz;

  always @(posedge clk or posedge reset) begin
    if(reset)
    led_col <= 8'b0;
    led_row <= 8'b0;
  end else begin
    mem[0]<={4'b0, bleft, bup, bright, bdown}
  end

reg [7:0] count;
always @(posedge clk or posedge reset) begin
  if(reset) count <=1;
  else begin
    count=count<<1;
    if(count==0) count=1;
    led_row=(count);
  end
        
  case(count)
    8'b1: led_col=~(mem[0]);
    8'b1<<1: led_col=~(mem[1]);
    8'b1<<2: led_col=~(mem[2]);
    8'b1<<3: led_col=~(mem[3]);
    8'b1<<4: led_col=~(mem[4]);
    8'b1<<5: led_col=~(mem[5]);
    8'b1<<6: led_col=~(mem[6]);
    8'b1<<7: led_col=~(mem[7]);
    default: led_col=~(mem[0]);
    
    endcase
end



endmodule
