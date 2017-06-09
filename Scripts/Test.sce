y=wavread("./154997700.wav");

//I/Q data broken apart
f = 154997700               //f is the Am signal band
O = 2*%pi*f                 //O is 2 times pi times the signal band
Q = y(1,:);                 //Q is the first row of the data
I = y(2,:);                 //I is the second row of the data
n = size(I,2)               //n is the size of I. 5986304
p = floor(log(n)/log(2));   //rounds down result of log(size of matrix)/log(2))
n = 2^p                     //n now is smaller. 419304
I = I(1:n);                 //make I only the elements up to n (smaller)
Q = Q(1:n);                 //make Q only the elements up to n (smaller)


dt = 0.5e-6                 //change in time is very small .000005 (samples?)

//Demodulation
t = linspace(0,dt*(n-1),n)  //creates evenly spaced pts according to time for whole vector
E = I + %i*Q;               //E is the whole signal.
D = exp(%i*O*t);            //D is e^(i*(2*pi*am-band)*time.)

//Removes carrier
B = E./D;                   //B is whole signal divided by whatever D is up there.
Br = real(B);               //Br is only real values of B. no imaginary stuff.
//B1 = Br.*cos(O*t);        //B1 is the signal carrier?

//plot(abs(fE));            //plot fE

//Fast Fourier Transform

df = 1/(n*dt);              //change in f is 1 over number of elements times time.
m = n                       //copy n to m

fE = fft(E(1:m), -1);       //fE is the fast fourier transform of entire signal,-1 idk

//separate frequency into two halves
for i = 1:m                 //for entire length of vector,
    if(i<(m/2)+1) then      //if first half of vector
        fr(i) = (i-1)*df;   //frequency of i is previous element times df
    else                    //second half of vector
        fr(i) = (i-m-1)*df; //subtract length of whole vector and 1 more if in tophalf.
    end
end

//plot(fr,abs(fE));         //plot frequency of fast fourier of entire signal.
//plot(fr(1:2000000)',abs(fE(1:2000000)))     //same plot but only 1 to 2000000th element

playsnd(Br,2e6)             //play sound for realB idk what B is exactly.
