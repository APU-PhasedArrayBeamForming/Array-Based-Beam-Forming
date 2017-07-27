//y=wavread("C:\Users\Justin\Desktop\Array-Based-Beam-Forming\Scripts\Fc100KHz_2MSPS_1KHzModulation_June12_2017.wav");
//most recent with signal
//y=wavread("C:\Users\Justin\Desktop\Array-Based-Beam-Forming\Scripts\SDRuno_20170718_165226Z_1090002kHz.wav");


//first
//y=wavread("C:\Users\Justin\Documents\SDRuno_20170727_160623Z_1090000kHz.wav");
//second
y=wavread("C:\Users\Justin\Documents\SDRuno_20170727_160643Z_1090000kHz.wav");

//y=wavread("C:\Users\Justin\Documents\Visual Studio 2015\Projects\ConsoleApplication1\ConsoleApplication1\bin\Debug\outputfile2.wav");
//y=wavread("C:\Users\Justin\Documents\Visual Studio 2015\Projects\ConsoleApplication1\ConsoleApplication1\bin\Debug\outputfile2.wav");

//I/Q data broken apart
f = 5*10^3      

O = 2*%pi*f     
I = y(1,:);     
Q = y(2,:);     
//n = size(I,2)   
//p = floor(log(n)/log(2)); //n = 
//n = 2^p
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

downsampling_E = E(1:16:length(E));

//Removes carrier
B = E./D;
Br = real(B);//this is same as
//B1 = Br.*cos(O*t); //this
//downsampling_Br = Br(1:8:length(Br));

//plot(abs(fE));

//Fast Fourier Transform

df = 1/(n*dt);
m = n
//m=n/16

fE = fft(E(1:m), -1);
//fE = fft(downsampling_E(1:m), -1);

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
//plot(fr(1:m)',abs(Zf(1:m)))


    //downsampling_fE = fE(1:10:length(fE));

    //plot spectrum (frequency vs relative amplitude)
//z = 20*log10(abs(fE)/max(abs(fE)));
//plot(fr(1:m)',z)

    //original plot commands
//plot(fr,abs(fE));
//plot(fr(1:m)',abs(fE(1:m)))

//plot (I(1:90000))
//.16 I 3200 to 8748
//plot (I(1:m))
//plot (Q(1:m))
//plot (Q(1:90000))
//.5788 Q 850 to 6420
E2=real(E)
thresholdIdx=0;
l=length(E2)
for i = 1:l
    if ((E2(i)>.1)&(thresholdIdx==0)) then
        thresholdIdx=i;
    end
end

j=1
thresh=thresholdIdx+5500
for i=thresholdIdx:thresh
    ECut(j)=E2(i)
    j=j+1
end

plot (ECut)
//plot (E(1:90000))
//.1 is around middle, could work as pivot pt.
//if it crosses boundary, start rec, if it crossed down, check to see if enough data was recorded/ record for length of 3200 -8740 =5,540(1 time only)

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
