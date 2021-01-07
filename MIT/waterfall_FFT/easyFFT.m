function [absX,freq]=easyFFT(data)             
   A=data';
   t=A(1,:);
   Dis=A(2,:);
   N=length(A);
   delt=(t(2)-t(1));
   Fs=1/delt;   %get the number of points
   k=0:N-1;     %create a vector from 0 to N-1
  T=N/Fs;       %get the frequency interval
   freq=k/T;    %create the frequency range
   X=fft(Dis)/N*2; % normalize the data
 
   %only want the first half of the FFT, since it is redundant
   cutOff = ceil(N/2); 
 
   %take only the first half of the spectrum
   X = X(1:cutOff);
   freq = freq(1:cutOff);
   absX=abs(X);
  
  plot(freq,absX); xlabel('Frequency'); ylabel('Amplitude');
  
  