README For Scripting
By Trevor Kroeger
Date: 5/7/2014
Description:
I have long thought of Verilog as more than just an HDL language. It is
extremely powerful and can be used for much more than programmable logic
description. The problem is that many people constrain its use but it can be
particularly helpful when preforming bit operations. There are a few programs
which support my assertion that Verilog can be used as a scripting language or
at least more than its intended use. File IO shows that you can preform simple
file IO operations. The Mini-DES and Mini-MD5 are homework problems in which I
used Verilog to do because the bit operations were easier to perform in Verilog
than using Python.


File IO
This module preforms file IO in Verilog. I don't know who originally
created it but it supports reasoning for using Verilog as a Scripting
Language. It is here for a reference to future work.

Mini-DES:
Consider function tinyDES defined by applying the following modifications to
DES (abstracted here, for simplicity, as a 15-round Feistel network, with
round index n=1,...,15):

a.	8-bit message inputs instead of 64-bit message inputs
b.	8-bit secret key k(0,0),k(0,1),k(1,0),k(1,1),k(2,0),k(2,1),k(3,0),k(3,1)
    inputs instead of 56-bit secret key inputs
c.	for n=1,..,15, the n-th round key is computed as 4 bits k'(0),..,k'(3)
    selected from the 8-bit secret key, as follows: write n in binary as
    n(0),n(1),n(2),n(3), and define k'(j)=k(j,n(j)), for j=0,1,2,3;
d.	for n=1,..,15, the n-th round application of function F returns the bitwise
    xor between the current R input and the n-th round key k'.

Assume the initial left input L is 0111, the initial right input R is 0011, and
the 8-bit key is 10100011. Which of the following is the output of tinyDES?
It should be a string between 10000000 and 1011111111


Mini MD5:
Consider function tinyMD5 defined by applying the following modifications to
MD5:

a.	12 operations instead of 64
b.	each operation maps a 4-bit state (A,B,C,D) into a 4-bit state (A,B,C,D)
c.	operations 1,5,9 (resp., 2,6,10) (resp., 3,7,11) (resp., 4,8,12) use
    function F (resp., G) (resp., H) (resp., I)
d.	addition mod 32 is replaced by logical XOR
e.	the left bit rotation by s bits is replaced by logical NOT
f.	M(i) and K(i) are bits.

Assume the initial state is 1100, the message M(1),...,M(12) is 110110111010
and the constant K(1),..,K(12) is 010110011011. Which of the following is the
output of tinyMD5?
It should be a string between 1100 and 1111
