    //filter things
    //plot
N=32
//h=eqfir(32,[0 0.2; 0.3 0.5], [1 1],[1 0]);
hn=eqfir(33,[0 .2;.25 .35;.4 .5],[0 1 0],[1 1 1]);
g=hn
g(N+1:512)=0
plot(20*log10(abs(fft(g,-1))))
//y=convol(h,x))
