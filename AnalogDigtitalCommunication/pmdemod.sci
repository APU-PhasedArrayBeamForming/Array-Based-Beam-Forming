function[y] = pmdemod(x,Vc,Em,Ec,fc,fs)
    //x - FM modulated signal
    //Vc- carrier amplitude signal
    //Em - Message signal amplitude in volts
    //Ec - Carrier signal amplitude in volts
    //fc - Carrier signal frequency in Hz
    //fs - Sampling frequency in samples/sec
    Xdiff = diff(x); //Converting the FM signal into AM signal
    //Envelope changes are recovered by taking the difference
    //between successive samples
    Xdiff = [Xdiff,Xdiff($)];
    //AM demodulation using envelope detector
    Xdem = Xdiff.*Vc;
    //Digital IIR butterworth filter of 5th order, cutoff freuency = fc/fs
    H =  iir(5,'lp','butt',[fc/fs,0],[0,0]);
    num = coeff(H(2));
    den = coeff(H(3));
    num = num(length(num):-1:1);
    den = den(length(den):-1:1);
    [y,zi] =  filter(num,den,abs(Xdem));//AC to DC conversion and LPF filtering
    y = filter(num,den,y,zi);
    plot(y,'r');
    title('PM demodulated Signal')
endfunction
