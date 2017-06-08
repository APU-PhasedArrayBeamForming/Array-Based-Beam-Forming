function [unipolar_out]=unipolarNRZ(x)
    //x-digital information signal
    binary_one = [1,1,1,1,1];
    binary_zero = [0,0,0,0,0];
    unipolar_out = [];
    for i = 1:length(x)
        if(x(i)==1)
            unipolar_out = [unipolar_out,binary_one];
        else
            unipolar_out = [unipolar_out,binary_zero];
        end
    end
    c = gca();
    c.x_location = 'origin'
    plot2d2([0:length(unipolar_out)-1],unipolar_out);
    a = gce(); 
    b = a.children(1);
    b.thickness = 3;
    title('Unipolar NRZ Line Coding technique')
endfunction 
//Example 1
//x =[1,1,0,0,0,1,1,0];
//unipolarNRZ(x);
