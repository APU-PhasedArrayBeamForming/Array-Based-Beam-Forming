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
