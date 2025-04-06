module counter #(
  parameter start = 0,  
  parameter WIDTH = 8
) (
  input wire clk,
  input wire [WIDTH-1:0] in,
  input wire sel_in,
  input wire reset,
  input wire down,
  output reg [WIDTH-1:0] out
);


  initial
    out <= start;

  always @(posedge clk or posedge reset) begin
    if(reset) out<= start;
    else begin
    if (sel_in)
      out <= in;
    else
      if (down)
        out <= out - 1;
      else
        out <= out + 1;
    end
  end


endmodule
