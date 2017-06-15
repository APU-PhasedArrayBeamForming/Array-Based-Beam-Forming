function [Bipolar_out]=BipolarNRZ(x)
    //x-digital information signal
    //Bipolar_out-Bipolar NRZ code
    binary_one = [1,1,1,1,1];
    binary_zero = [0,0,0,0,0];
    S = 1;
    Bipolar_out = [];
    for i = 1:length(x)
        if(x(i)==1)
            Bipolar_out = [Bipolar_out,S*binary_one];
            S = S*-1;
        else
            Bipolar_out = [Bipolar_out,binary_zero];
        end
    end
    c = gca();
    c.x_location = 'origin'
    plot2d2([0:length(Bipolar_out)-1],Bipolar_out);
    a = gce(); 
    b = a.children(1);
    b.thickness = 3;
    title('BiPolar NRZ Line Coding technique')
endfunction 
//Example 1
//x =[1,1,0,0,0,1,1,0];
//BipolarNRZ(x);
