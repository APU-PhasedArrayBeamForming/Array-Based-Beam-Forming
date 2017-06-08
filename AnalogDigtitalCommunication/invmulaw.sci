function x =  invmulaw(y,mu)
  //Non-linear Quantization
  //invmulaw: inverse mulaw nonlinear quantization
  //x = output vector 
  //y = input vector (using mulaw nonlinear comression)
  x = (((1+mu).^(abs(y))-1)./mu)  
endfunction
