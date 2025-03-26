module injetor(
  input [8:0] entrada,
  input [3:0] n,
  input erro,
  output reg [8:0] saida
);

reg [8:0] mascara;
// insira seu código aqui

always @(*) begin
  case (n)
    4'b0000: mascara = 9'b000000001;
    4'b0001: mascara = 9'b000000010;
    4'b0010: mascara = 9'b000000100;
    4'b0011: mascara = 9'b000001000;
    4'b0100: mascara = 9'b000010000;
    4'b0101: mascara = 9'b000100000;
    4'b0110: mascara = 9'b001000000;
    4'b0111: mascara = 9'b010000000;
    4'b1000: mascara = 9'b100000000;
    default: mascara = 9'b000000000;
  endcase

  if (erro == 1) begin
    saida = entrada ^ mascara;
  end else begin
    saida = entrada;
  end

end;

endmodule
