function [Rxx] = autocorrelation(x)
//Autocorrelation of a given Input Sequence
//Finding out the period of the signal using autocorrelation technique

L = length(x);
h = zeros(1,L);
for i = 1:L
  h(L-i+1) = x(i);
end
N = 2*L-1;
Rxx = zeros(1,N);
for i = L+1:N
   h(i) = 0;
end
for i = L+1:N
    x(i) = 0;
end
for n = 1:N
  for k = 1:N
    if(n >= k)
      Rxx(n) = Rxx(n)+x(n-k+1)*h(k);
    end
  end
end
disp('Auto Correlation Result is')
Rxx
disp('Center Value is the Maximum of autocorrelation result')
[m,n] = max(Rxx)
disp('Period of the given signal using Auto Correlation Sequence')
n
endfunction
