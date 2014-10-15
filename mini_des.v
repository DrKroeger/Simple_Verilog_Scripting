module mini_des ();

reg  [7:0] key;
reg  [3:0] rnd_key;
reg  [3:0] left;
reg  [3:0] right;
reg  [3:0] temp;
reg  [4:0] i;


function [3:0] F(input [3:0] l,r,k); begin
  F = l^(r^k);
end
endfunction

initial begin
key = 8'b1010_0011;
left = 4'b0111;
right = 4'b0011;

$display("Left:%b Right:%b Key:%b ",left,right,key);

  for(i=0;i<16;i=i+1) begin
    rnd_key[3] = (i[3])?key[7]:key[6];
    rnd_key[2] = (i[2])?key[5]:key[4];
    rnd_key[1] = (i[1])?key[3]:key[2];
    rnd_key[0] = (i[0])?key[1]:key[0];
    temp = left;
    left = right;
    right = F(temp,right,rnd_key);
    $display("Left:%b Right:%b   Round Key Value:%b",left,right,rnd_key);
  end
  $display("\nResults Left:%b Right:%b\n\n",left,right);

key = 8'b1100_0101;  
left = 4'b0111;
right = 4'b0011;

$display("Left:%b Right:%b Key:%b ",left,right,key);

  for(i=0;i<16;i=i+1) begin
    rnd_key[3] = (i[3])?key[7]:key[6];
    rnd_key[2] = (i[2])?key[5]:key[4];
    rnd_key[1] = (i[1])?key[3]:key[2];
    rnd_key[0] = (i[0])?key[1]:key[0];
    temp = left;
    left = right;
    right = F(temp,right,rnd_key);
    $display("Left:%b Right:%b   Round Key Value:%b",left,right,rnd_key);
  end
  $display("\nResults Left:%b Right:%b\n\n",left,right);

end

endmodule

/*
# Left:0111 Right:0011 Key:10100011 
# Left:0011 Right:0101   Round Key Value:0001
# Left:0101 Right:0111   Round Key Value:0001
# Left:0111 Right:0011   Round Key Value:0001
# Left:0011 Right:0101   Round Key Value:0001
# Left:0101 Right:0011   Round Key Value:0101
# Left:0011 Right:0011   Round Key Value:0101
# Left:0011 Right:0101   Round Key Value:0101
# Left:0101 Right:0011   Round Key Value:0101
# Left:0011 Right:1111   Round Key Value:1001
# Left:1111 Right:0101   Round Key Value:1001
# Left:0101 Right:0011   Round Key Value:1001
# Left:0011 Right:1111   Round Key Value:1001
# Left:1111 Right:0001   Round Key Value:1101
# Left:0001 Right:0011   Round Key Value:1101
# Left:0011 Right:1111   Round Key Value:1101
# Left:1111 Right:0001   Round Key Value:1101
# 
# Results Left:1111 Right:0001
# 
# 
# Left:0111 Right:0011 Key:11000101 
# Left:0011 Right:1111   Round Key Value:1011
# Left:1111 Right:0110   Round Key Value:1010
# Left:0110 Right:0000   Round Key Value:1001
# Left:0000 Right:1110   Round Key Value:1000
# Left:1110 Right:0101   Round Key Value:1011
# Left:0101 Right:0001   Round Key Value:1010
# Left:0001 Right:1101   Round Key Value:1001
# Left:1101 Right:0100   Round Key Value:1000
# Left:0100 Right:0010   Round Key Value:1011
# Left:0010 Right:1100   Round Key Value:1010
# Left:1100 Right:0111   Round Key Value:1001
# Left:0111 Right:0011   Round Key Value:1000
# Left:0011 Right:1111   Round Key Value:1011
# Left:1111 Right:0110   Round Key Value:1010
# Left:0110 Right:0000   Round Key Value:1001
# Left:0000 Right:1110   Round Key Value:1000
# 
# Results Left:0000 Right:1110
*/