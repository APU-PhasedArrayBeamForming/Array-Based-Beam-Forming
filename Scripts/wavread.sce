y=wavread("./Fc100KHz_2MSPS_1KHzModulation_June12_2017.wav")
//[y,Fs,bits]=wavread("./Record.wav");Fs,bits
//Fs
//bits
subplot(2,1,1)
plot2d(y(1,:)) // first channel 
subplot(2,1,2)
plot2d(y(2,:)) // second channel
//y=wavread("./Record.wav") //the first five samples


