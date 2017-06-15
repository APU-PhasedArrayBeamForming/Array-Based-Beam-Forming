function [Cx,Xmax] =  Alaw(x,A)
  //Non-linear Quantization
  //A-law: A-law nonlinear quantization
  //x = input vector
  //Cx = A-law compressor output
  //Xmax = maximum of input vector x
  Xmax  = max(abs(x));
  for i = 1:length(x)
    if(x(i)/Xmax < = 1/A)
       Cx(i) = A*abs(x(i)/Xmax)./(1+log(A));
    elseif(x(i)/Xmax > 1/A)
      Cx(i) = (1+log(A*abs(x(i)/Xmax)))./(1+log(A));
    end
  end
  Cx = Cx/Xmax; //normalization of output vector
  Cx = Cx';
endfunction
