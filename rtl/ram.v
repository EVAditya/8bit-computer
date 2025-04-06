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
      for (i = 0; i<258; i=i+1) begin
        mem[i] = 8'b0;
      end
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
