MATLAB Code: 
 
 
 
%%%%%%%%%%%%ECG Signal Generation%%%%%%%%%%%%%%%%%%%%%%%%% 
Length=1000*10; i=1:Length; ECG_signal=ecg(50); ECG=ECG_signal; for i=1:Length/50-1 ECG_signal=[ ECG_signal ECG]; clc; end j=ECG_signal; subplot(911); plot(j,'r') ;title('ECG Signal'); %ECG Signal Generation 
  
  
Fs=500; 
x = repmat(ecg(Fs), 1, 9); x = x + randn(1,lh(x)).*0.20; %ECG Signal With Noise 
  
%# plot noisy signal figure(2); plot(x); 
title('Noisy ECG Signal') 
  
%%%%%%%%%%%%%ECG With Noise%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
 
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%Filter Designs%%%%%%%%%%%%%%%%%%% 
 
fN = 25 / (Fs/2);               %# normalized cutoff frequency 
[b,a] = butter(1, fN, 'low');  %# 5th order filter y1 = filtfilt(b, a, x); figure(3); plot(y1); title('butterworth1') 
  
               %# normalized cutoff frequency [b,a] = butter(15, fN, 'low');  %# 10th order filter y2 = filtfilt(b, a, x); figure(4); plot(y2); title('butterworth2') 
  
  
%# normalized cutoff frequency 
[b,a] = butter(20, fN, 'low');  %# 15th order filter y3 = filtfilt(b, a, x); figure(5); 
plot(y3); title('butterworth3') 
  
    order = 10; 
h = fir1(order,fN,'high'); %high pass Butterworth y5 = filter(h, 1, x); figure(7); plot(y5); title('fir2')  
%# gaussian window = 7; 
h = normpdf( -window:window, 0, fix((2*window+1)/6) ); y = filter(h, 1, x); 
subplot(916), plot( y ), set(gca, 'YLim', [-1 1], 'xtick',[]) title('gaussian')  
  
%%%%%%%%%%%%%%%%%%%%%%%%%END%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
