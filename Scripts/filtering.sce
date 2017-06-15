    //filter things
    //plot
N=64
h=eqfir(N,[0 .4; .45 .5], [1 0],[1 1]);
//hn=eqfir(33,[0 .2;.25 .35;.4 .5],[0 1 0],[1 1 1]);
g=h
//g=hn
g(N+1:512)=0
plot(20*log10(abs(fft(g,-1))))
//y=convol(h,x))
