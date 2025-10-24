module mb(input mbpx, mbpy, output mbpz);
    assign mbpz = mbpx ~& mbpy;
endmodule