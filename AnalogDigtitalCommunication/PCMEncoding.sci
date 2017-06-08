function [c] = PCMEncoding(x,L,en_code)
  //Encoding: Converting Quantized decimal sample values in to binary
   //x = input sequence
   //L = number of qunatization levels 
   //en_code = normalized input sequence
n = log2(L);
c = zeros(length(x),n);
for i = 1:length(x)
  for j = n:-1:0
    if(fix(en_code(i)/(2^j))==1)
      c(i,(n-j)) =1;
      en_code(i) = en_code(i)-2^j;
    end
  end
end
disp(c)
