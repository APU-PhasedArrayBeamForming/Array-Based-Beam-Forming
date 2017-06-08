function[Hamming_Distance] = HammingDistance(code1,code2)
//Caption: Hamming Weight and Hamming Distance
//H(7,4)
//Code Word Length = 7, Message Word length = 4, Parity bits =3
//Getting Code Words
function [value] = xor(A,B)
  if(A==B)
    value = 0;
  else
    value = 1;
  end
endfunction

//code1 = input('Enter the first code word');
//code2 =  input('Enter the second code word');
Hamming_Distance = 0;
for i = 1:length(code1)
  Hamming_Distance =Hamming_Distance+xor(code1(i),code2(i));
end
disp(Hamming_Distance,'Hamming Distance')
endfunction
//Result
//Enter the first code word [0,1,1,1,0,0,1]
//Enter the second code word[1,1,0,0,1,0,1]
//Hamming Distance       4.  
