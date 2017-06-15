function [C,b,m]= HammingEncode(m3,m2,m1,m0)
//Caption:Hamming Encoding
//H(7,4)
//Code Word Length = 7, Message Word length = 4, Parity bits =3
//function for XOR gate
    function [value] = xor(A,B)
        if(A==B)
            value = 0;
        else
            value = 1;
        end
    endfunction
//Getting Message Word
//m3 = input("Enter the 1 bit(MSb) of message word")
//m2 = input("Enter the 2 bit of message word")
//m1 = input("Enter the 3 bit of message word")
//m0 = input("Enter the 4 bit(LSb) of message word")
//Generating Parity bits
for i = 1:(2^4)
  b2(i) = xor(m0(i),xor(m3(i),m1(i)));
  b1(i) = xor(m1(i),xor(m2(i),m3(i)));
  b0(i) = xor(m0(i),xor(m1(i),m2(i)));
  m(i,:) = [m3(i) m2(i) m1(i) m0(i)];
  b(i,:) = [b2(i) b1(i) b0(i)];
end
C = [b m];
disp('___________________________________________________________')
for i = 1:2^4
  disp(i)
  disp(m(i,:),'Message Word')
  disp(b(i,:),'Parity Bits')
  disp(C(i,:),'CodeWord')
  disp("   ");
  disp("   ");
end
disp('___________________________________________________________')
endfunction
//disp(m b C)
//Result
//Enter the 1 bit(MSb) of message word [0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1];
//Enter the 2 bit of message word [0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1];
//Enter the 3 bit of message word [0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1];
//Enter the 4 bit(LSb) of message word [0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1];
