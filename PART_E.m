%PART E.
%Mahmoud Hamdan 1201134.
%Yazzed Hamdan 1201133.
%Mohammad Abu Shams 1200549.
%SEC2.

%Load the data.
load('css.mat')
%Load the impulse response.
load('path.mat')

%Concatenate Ten blocks of CSS.
css_concat=repmat(css,1,10);

M=128;%Taps.
u=0.25;%Step Size.
epsilon = 1e-6;
w=zeros(M, 1);
y=zeros(size(css_concat));%Echo.
e=zeros(size(css_concat));%Error.

%Adaptive line echo canceller.
for n=M:length(css_concat)
    x_n=css_concat(n:-1:n-M+1).';%Tap inputs (column vector).
    y(n)=w' *x_n;%Echo replica.
    e(n)=echo_signal(n)-y(n);%Error signal.
    w=w+(u/(epsilon + x_n' * x_n))*e(n)*x_n;%Update weights.
end

%Plot the estimated FIR channel response.
[H_estimated,frequencies_estimated]=freqz(w,1,1024,Fs);
amplitude_response_estimated=abs(H_estimated);
phase_response_estimated=angle(H_estimated);

figure;
subplot(2,1,1);
plot(frequencies_estimated, 20*log10(amplitude_response_estimated), 'b', 'linewidth', 1.2);
xlabel('Hz');
ylabel('dB');
title('Estimated FIR Channel Amplitude Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-80,0]);% Y axsis from -80-0. 

subplot(2,1,2);
plot(frequencies_estimated, phase_response_estimated, 'r', 'linewidth', 1.2);
xlabel('Hz');
ylabel('Phase (rad)');
title('Estimated FIR Channel Phase Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-5,5]);% Y axsis from -5-5. 

% Plot the given FIR system (Path) response for comparison.
[H_given, frequencies_given]=freqz(path, 1, 1024, Fs);
amplitude_response_given=abs(H_given);
phase_response_given=angle(H_given);

figure;
subplot(2,1,1);
plot(frequencies_given, 20*log10(amplitude_response_given), 'b', 'linewidth', 1.1);
xlabel('Hz');
ylabel('dB');
title('Given FIR Channel Amplitude Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-80,0]);% Y axsis from -80-0. 

subplot(2,1,2);
plot(frequencies_given, phase_response_given,'r','linewidth', 1.1);
xlabel('Hz');
ylabel('Phase (rad)');
title('Given FIR Channel Phase Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-5,5]);% Y axsis from -5-5. 
