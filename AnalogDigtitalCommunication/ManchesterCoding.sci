function [Manchester_out]= ManchesterCoding(x)
    //x-digital information signal
    //Manchester_out-Manchester code
    binary_one = [1,1,1];
    binary_minus_one = -[1,1,1];
    Manchester_out = [];
    for i = 1:length(x)
        if(x(i)==1)
            Manchester_out = [Manchester_out,binary_one,binary_minus_one];
        else
            Manchester_out = [Manchester_out,binary_minus_one,binary_one];
        end
    end
    c = gca();
    c.x_location = 'origin'
    plot2d2([0:length( Manchester_out)-1], Manchester_out);
    a = gce(); 
    b = a.children(1);
    b.thickness = 3;
    title(' Manchester Line Coding technique')
endfunction
//Example 1
//x =[1,1,0,0,0,1,1,0];
//Manchester_Coding(x);
