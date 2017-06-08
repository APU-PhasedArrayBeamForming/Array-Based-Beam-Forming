function [polar_out]=polarNRZ(x)
    //x-digital information signal
    binary_one = [1,1,1,1,1];
    binary_minus_one = -[1,1,1,1,1];
    polar_out = [];
    for i = 1:length(x)
        if(x(i)==1)
            polar_out = [polar_out,binary_one];
        else
            polar_out = [polar_out,binary_minus_one];
        end
    end
    c = gca();
    c.x_location = 'origin'polar
    plot2d2([0:length(polar_out)-1],polar_out);
    a = gce(); 
    b = a.children(1);
    b.thickness = 3;
    title('Polar NRZ Line Coding technique')
endfunction 
//Example 1
//x =[1,1,0,0,0,1,1,0];
//polarNRZ(x)
