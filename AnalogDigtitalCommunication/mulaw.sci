function [Cx,Xmax] =  mulaw(x,mu)
  //Non-linear Quantization
  //mulaw: mulaw nonlinear quantization
  //x = input vector
  //Cx = mulaw compressor output
  //Xmax = maximum of input vector x
  Xmax  = max(abs(x));
  if(log(1+mu)~=0)
    Cx = (log(1+mu*abs(x/Xmax))./log(1+mu));
  else
    Cx = x/Xmax;
  end
  
  Cx = Cx/Xmax; //normalization of output vector
endfunction
