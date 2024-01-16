%PART A.
%Mahmoud Hamdan 1201134.
%Yazzed Hamdan 1201133.
%Mohammad Abu Shams 1200549.
%SEC2.
%Load the impulse response.
load('path.mat'); 
impulse_response=path;
Fs=8000;%Sampling frequency=8Khz.

%Plot the impulse response.
figure;
plot(0:length(impulse_response)-1,impulse_response,'g','linewidth',1.2);
xlabel('Tap Index');
ylabel('Amplitude');
title('Impulse Response');
xlim([0,90]);% X axsis from 0-90. 

%Compute the frequency response.
[H,frequencies]=freqz(impulse_response,1,1024,Fs);
%Magnitude response.
magnitude_response=abs(H);

%Plot the magnitude response.
figure;
plot(frequencies,20*log10(magnitude_response),'b','linewidth',1.3);
xlabel('Hz');
ylabel('dB');
title('Frequency Response');

