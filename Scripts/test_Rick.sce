y=wavread("./temp/Fc1030MHz_10MSPS_1KHzModulation_June11_2017_RecA.wav");

//I/Q data broken apart
f = 1030000000

O = 2*%pi*f
I = y(1,:);
Q = y(2,:);
n = size(I,2)
p = floor(log(n)/log(2));
n = 2^p
n=262144
I = I(1:n);
Q = Q(1:n);

//Sample Rate = samp, Time Step = dt
samp=10*10^6;
dt = 1/samp

//Demodulation
t = linspace(0,dt*(n-1),n)
E = I + %i*Q;
//D = exp(%i*O*t);
//Removes carrier
//B = E./D;
//Br = real(B);
//B1 = Br.*cos(O*t);

//plot(abs(fE));

//Fast Four Year Transform

df = 1/(n*dt);
m = n

fE = fft(E(1:m), -1);

for i = 1:m
    if(i<(m/2)+1) then
        fr(i) = (i-1)*df;
    else
        fr(i) = (i-m-1)*df;
    end
end

//plot(fr,abs(fE));
plot(fr(1:m/3000)',abs(fE(1:m/3000)))
//Qmu=lin2mu(Q)
//wavwrite(Qmu,samp,'./foo.wav');
//savewave('./foo.wav',Q,samp)
//playsnd(E,samp)
