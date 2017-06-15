function [w]=fskmod(data,Ac,fc1,fc2)
    //fc1 - carrier signal frequency for binary 1 in Hz
    //fc2 -  carrier signal frequency for binary 0 in Hz
    //Ac - carrier signal amplitude in volts
    //data - digital information  signal
    //w -BFSK modulated signal
    t = 0:0.001:1;
    x = Ac*sin(2*%pi*fc1*t);
    y = Ac*sin(2*%pi*fc2*t);
    z = data;
    w =[];
    for i = 1:length(z)
        if(z(i)==1) then
            w = [w,x];
        else
            w = [w,y];        
        end
    end
    plot(w)
    title('Frequency Shift Keying Modulated Signal')
endfunction
//Example 1
//fc1 =1
//fc2 = 5
//Ac = 2
//data =[1,1,0,0,0,1,1,0]
