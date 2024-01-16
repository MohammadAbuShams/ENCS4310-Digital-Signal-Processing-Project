%PART B.
%Mahmoud Hamdan 1201134.
%Yazzed Hamdan 1201133.
%Mohammad Abu Shams 1200549.
%SEC2.
%Load the data.
load('css.mat'); 
css_data=css;
N=length(css_data);
Fs=8000;%Sampling frequency=8Khz.

%Plot the CSS data.
figure;
plot(1:N,css_data,'b','linewidth',1.1);
xlabel('Time');
ylabel('Amplitude');
title('Composite Source Signal');
xlim([0,5000]);% X axsis from 0-5000. 
ylim([-4,4]);% Y axsis from -4-4. 

%Compute(PSD).
[psd,frequencies]=pwelch(css_data,[],[],[],Fs,'power');

%Normalize the PSD.
max_psd=max(10*log10(psd));
psd_normalized=10*log10(psd)-max_psd;

%Plot the normalized PSD.
figure;
plot(frequencies,psd_normalized,'r','linewidth',1.3);
xlabel('Hz');
ylabel('dB');
title('Signal Spectrum');
xlim([0,4000]);% X axsis from 0-4000. 
 

