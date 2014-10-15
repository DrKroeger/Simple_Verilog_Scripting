module mini_md5 ();

reg [11:0] key;
reg [11:0] message;
reg  [3:0] iv;
reg  [3:0] int;
reg        funct,a,m,k,n;
integer i;


function F(input b,c,d); begin
  F = (b&c)|(~b&d);
end
endfunction
function G(input b,c,d); begin
  G = (b&d)|(c&~d);
end
endfunction
function H(input b,c,d); begin
  H = b^c^d;
end
endfunction
function I(input b,c,d); begin
  I = c^(b|~d);
end
endfunction

initial begin
key = 12'b0101_1001_1011;
// key = 12'b1101_1001_1010;
message = 12'b1101_1011_1010;
// message = 12'b0101_1101_1011;
iv = 4'b0011;

$display("IV:%b Message:%b Key:%b ",iv,message,key);

  for(i=1;i<=12;i=i+1) begin
    // Function F
    if((i==1)|(i==5)|(i==9))begin
      funct = F(iv[2],iv[1],iv[0]);
    end
    // Function G
    if((i==2)|(i==6)|(i==10))begin
      funct = G(iv[2],iv[1],iv[0]);
    end
    // Function H
    if((i==3)|(i==7)|(i==11))begin
      funct = H(iv[2],iv[1],iv[0]);
    end
    // Function I
    if((i==4)|(i==8)|(i==12))begin
      funct = I(iv[2],iv[1],iv[0]);
    end

    // Input A xor with function output
    a = iv[3] ^ funct;
    m = a ^ message[i-1];
    k = m ^ key[i-1];
    n = ~k;
    iv[3] = iv[0];
    iv[2] = n ^ iv[2];
    iv[1] = iv[2];
    iv[0] = iv[1];
    $display("Round Value:%b    Round Function Value:%b",iv,funct);
  end
  $display("\nResult:%b\n\n",iv);
  
  
iv = 4'b1100;

$display("IV:%b Message:%b Key:%b ",iv,message,key);

  for(i=1;i<=12;i=i+1) begin
    // Function F
    if((i==1)|(i==5)|(i==9))begin
      funct = F(iv[2],iv[1],iv[0]);
    end
    // Function G
    if((i==2)|(i==6)|(i==10))begin
      funct = G(iv[2],iv[1],iv[0]);
    end
    // Function H
    if((i==3)|(i==7)|(i==11))begin
      funct = H(iv[2],iv[1],iv[0]);
    end
    // Function I
    if((i==4)|(i==8)|(i==12))begin
      funct = I(iv[2],iv[1],iv[0]);
    end

    // Input A xor with function output
    a = iv[3] ^ funct;
    m = a ^ message[i-1];
    k = m ^ key[i-1];
    n = ~k;
    iv[3] = iv[0];
    iv[2] = n ^ iv[2];
    iv[1] = iv[2];
    iv[0] = iv[1];
    $display("Round Value:%b    Round Function Value:%b",iv,funct);
  end
  $display("\nResult:%b",iv);

end

endmodule

/*
# IV:0011 Message:110110111010 Key:010110011011 
# Round Value:1111    Round Function Value:1
# Round Value:1000    Round Function Value:1
# Round Value:0000    Round Function Value:0
# Round Value:0000    Round Function Value:1
# Round Value:0111    Round Function Value:0
# Round Value:1000    Round Function Value:1
# Round Value:0000    Round Function Value:0
# Round Value:0000    Round Function Value:1
# Round Value:0111    Round Function Value:0
# Round Value:1111    Round Function Value:1
# Round Value:1000    Round Function Value:1
# Round Value:0000    Round Function Value:1
# 
# Result:0000
# 
# 
# IV:1100 Message:110110111010 Key:010110011011 
# Round Value:0000    Round Function Value:0
# Round Value:0111    Round Function Value:0
# Round Value:1111    Round Function Value:1
# Round Value:1111    Round Function Value:0
# Round Value:1000    Round Function Value:1
# Round Value:0111    Round Function Value:0
# Round Value:1111    Round Function Value:1
# Round Value:1111    Round Function Value:0
# Round Value:1000    Round Function Value:1
# Round Value:0000    Round Function Value:0
# Round Value:0111    Round Function Value:0
# Round Value:1111    Round Function Value:0
# 
# Result:1111
*/