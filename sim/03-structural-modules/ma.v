module ma(input mapx, mapy, output mapz);
    assign mapz = (mapx | mapy) & mapx;
endmodule