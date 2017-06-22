//y=wavread("./Fc100KHz_2MSPS_1KHzModulation_June12_2017.wav");
y=wavread("C:./SDRuno_20170622_214335Z_105500kHz.wav");
//y=wavread("C:\Users\Justin\Desktop\firstconversion.wav");


//I/Q data broken apart
f = 5*10^3      //double f = 5*10^3

O = 2*%pi*f     //double O = f*2*Math.PI
I = y(1,:);     //double []I = new double[n]  //n is size of I
Q = y(2,:);     //double []Q = new double [m]  //m is size of Q
n = size(I,2)   //double n = size.length()
p = floor(log(n)/log(2)); //n = 
n = 2^p
n=262144
I = I(1:n);
Q = Q(1:n);

//Sample Rate = samp, Time Step = dt
samp=2*10^6;
dt = 1/samp

//Demodulation
t = linspace(0,dt*(n-1),n)
E = I + %i*Q;
D = exp(%i*O*t);


//Removes carrier
B = E./D;
Br = real(B);//this is same as
//B1 = Br.*cos(O*t); //this
downsampling_Br = Br(1:100:length(Br));

//plot(abs(fE));

//Fast Fourier Transform

df = 1/(n*dt);
m = n
//m=n/100

fE = fft(E(1:m), -1);
//fE = fft(downsampling_Br(1:m), -1);

for i = 1:m
    if(i<(m/2)+1) then
        fr(i) = (i-1)*df;
    else
        fr(i) = (i-m-1)*df;
    end
end


   //filter things
    //plot
N=32
h=eqfir(N,[0 .05; .15 .5], [1 0],[1 1]);
g=h
g(N+1:512)=0
//plot(20*log10(abs(fft(g,-1))))
//1e5 goal
//edges around 1khz

Z=convol(h,E)
Zf=fft(Z)
//plot(fr(1:m)',abs(Z(1:m)))
plot(fr(1:m)',abs(Zf(1:m)))


    //downsampling_fE = fE(1:10:length(fE));

    //plot spectrum (frequency vs relative amplitude)
//z = 20*log10(abs(fE)/max(abs(fE)));
//plot(fr(1:m)',z)

    //original plot commands
//plot(fr,abs(fE));
//plot(fr(1:m)',abs(fE(1:m)))
//plot(fr(1:m)',abs(fE(1:m)))
//Qmu=lin2mu(Q)
//wavwrite(Qmu,samp,'./foo.wav');
//savewave('./foo.wav',Q,samp)
//playsnd(downsampling_Br,samp/150)

//pseudo-code
//get data
//find fast fourier transform
//low-pass filter (decimate)
//demodulate
//decimate again for audio card of computer/listen in mono
//playsnd(decimatedthing,samp/1stdecimation/2nddecimation)
