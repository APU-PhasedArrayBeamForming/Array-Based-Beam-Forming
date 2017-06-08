function[y]=ampdemod(x,Vc,fc,fs,Em,Ec)
    //x - AM modulated signal
    //Vc - carrier signal
    //fc - carrier frequency
    //Em - message signal amplitude
    //Ec- carrier signal amplitude
    xdem = x.*Vc;
    //IIR digital butterworth Low Pass filter of cutoff
    //frequency fc/fs and order 7
    H = iir(7,'lp','butt',[fc/fs,0],[.1,.1]);
    num = coeff(H(2));
    den = coeff(H(3));
    num = num(length(num):-1:1);
    den = den(length(den):-1:1);
    y = filter(num,den,xdem);
//    y = y/Em;
//    y = y-Ec;
    plot(y,'r');
    title('AM Demodulated Signal')
endfunction 
//other stuff to get t
y=wavread("./personalMod.wav");


//I/Q data broken apart
f = 155000000
O = 2*%pi*f
Q = y(1,:);
I = y(2,:);
n = size(I,2)
p = floor(log(n)/log(2));
n = 2^p
I = I(1:n);
Q = Q(1:n);


dt = 0.5e-6

//Demodulation
t = linspace(0,dt*(n-1),n)
E = I + %i*Q;
D = exp(%i*O*t);
B = E./D;
Br = real(B);

//plot(abs(fE));

//Fast Fourier Transform

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



x=wavread("./personalMod.wav", "size")
[y,Fs,bits]=wavread("./personalMod.wav");Fs,bits
Vc=cos(600.*t)//carrier signal
fc=155000000 //carrier frequency

//function stuff
 xdem = real(I.*Vc);
    //IIR digital butterworth Low Pass filter of cutoff
    //frequency fc/fs and order 7
    H = iir(7,'lp','butt',[fc/Fs,0],[.1,.1]);
    num = coeff(H(2));
    den = coeff(H(3));
    num = num(length(num):-1:1);
    den = den(length(den):-1:1);
    j = filter(num,den,xdem);
//    y = y/Em;
//    y = y-Ec;
    plot(E,'r');
    title('AM Demodulated Signal')
    playsnd(j,2e6)
//plot(t,z,'b--');
//xlabel('Time (s)')
//ylabel('Amplitude')
//legend('Demodulated Signal')
