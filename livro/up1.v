module uP(
  input clock, reset,
  inout [7:0] mbr,
  output logic we,
  output logic [7:0] mar, pc, ir);

  parameter FETCH = 0, DECODE = 1, EXECUTE = 2;
  reg [1:0] state, nextstate;
  reg [7:0] acc;

  always @(posedge clock or posedge reset)
  begin
    if (reset) begin
      pc = 'b0;
      state <= FETCH;
    end
    else begin
      case(state)
      FETCH: begin
        we <= 0;
        pc <= pc + 1;
        mar <= pc;
      end
      DECODE: begin
        ir = mbr;
        mar <= {4'b1111, ir[3:0]};
      end
      EXECUTE: begin
        if (ir[7] == 1'b1)           // jump
          pc <= {1'b0, ir[6:0]};
        else if (ir[7:4] == 4'b0100) // indirect load
          acc <= mbr;
        else if (ir[7:4] == 4'b0101) // add acc + data
          acc <= acc + mbr;
        else if (ir[7:4] == 4'b0011) // store
          we <= 1'b1;
      end
      endcase
      state <= nextstate;
    end
  end

  always @(*)
    case(state)
      FETCH:   nextstate = DECODE;
      DECODE:  nextstate = EXECUTE;
      EXECUTE: nextstate = FETCH;
      default: nextstate = FETCH;
    endcase

  assign mbr = we ? acc : 'bz;
endmodule
