y=wavread("./Recordings/am1110.wav");


//I/Q data broken apart
f = 1110000
O = 2*%pi*f
Q = y(1,:);
I = y(2,:);
n = size(I,2)
p = floor(log(n)/log(2));
n = 2^p
I = I(1:n);
Q = Q(1:n);


dt = 1/1e7

//Demodulation
t = linspace(0,dt*(n-1),n)
E = I + %i*Q;
D = exp(%i*O*t);
B = E./D;
Br = real(B);

//plot(abs(fE));

//Fast Four Year Transform

df = 1/(n*dt);
m = n

fE = fft(I(1:m), -1);

for i = 1:m
    if(i<(m/2)+1) then
        fr(i) = (i-1)*df;
    else
        fr(i) = (i-m-1)*df;
    end
end

//plot(fr,abs(fE));
//plot(fr(1:2000000)',abs(fE(1:2000000)))

//playsnd(Br,10e6)

