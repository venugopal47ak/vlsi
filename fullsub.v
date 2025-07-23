module full_sub(x,y,bin,d,br);
  input x,y,bin;
  output d,br;
  wire a,b,c;
  and g1 (a,~x,y);
  and g2 (b,~x,bin);
  and g3 (c,y,bin);
  xor g4 (d,x,y,bin);
  
  or g6 (br,a,b,c);
  
endmodule
