% PART F.
% Mahmoud Hamdan 1201134.
% Yazzed Hamdan 1201133.
% Mohammad Abu Shams 1200549.
% SEC2.

% Load the data.
load('css.mat')
% Load the impulse response.
load('path.mat')

% Concatenate Ten blocks of CSS.
css_concat = repmat(css, 1, 10);

M=128; % Taps.
lambda=0.98;
delta=1; 

w=zeros(M,1);
P=delta*eye(M);

y = zeros(size(css_concat)); % Echo.
e = zeros(size(css_concat)); % Error.

% Recursive Least Squares adaptive filter.
for n = M:length(css_concat)
    x_n = css_concat(n:-1:n-M+1).'; % Tap inputs (column vector).
    y(n) = w' * x_n; % Echo replica.
    e(n) = echo_signal(n) - y(n); % Error signal.

    % Recursive Least Squares updates.
    k = ((lambda + x_n' * P * x_n)^-1) * P * x_n;
    alpha = e(n);
    w = w + alpha * k; % Weight update.
    P = (lambda^-1) * P - (lambda^-1) * k * x_n' * P; % Inverse correlation matrix update.
end

% Plot the estimated FIR channel response.
[H_estimated, frequencies_estimated] = freqz(w, 1, 1024, Fs);
amplitude_response_estimated = abs(H_estimated);
phase_response_estimated = angle(H_estimated);

figure;
subplot(2,1,1);
plot(frequencies_estimated, 20*log10(amplitude_response_estimated), 'b', 'linewidth', 1.1);
xlabel('Hz');
ylabel('dB');
title('RLS - Estimated FIR Channel Amplitude Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-80,0]);% Y axsis from -80-0.

subplot(2,1,2);
plot(frequencies_estimated, phase_response_estimated, 'r', 'linewidth', 1.1);
xlabel('Hz');
ylabel('Phase (rad)');
title('RLS - Estimated FIR Channel Phase Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-5,5]);% Y axsis from -5-5. 

% Plot the given FIR system (Path) response for comparison.
[H_given, frequencies_given] = freqz(path, 1, 1024, Fs);
amplitude_response_given = abs(H_given);
phase_response_given = angle(H_given);

figure;
subplot(2,1,1);
plot(frequencies_given, 20*log10(amplitude_response_given), 'k', 'linewidth', 1.1);
xlabel('Hz');
ylabel('dB');
title('Given FIR Channel Amplitude Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-80,0]);% Y axsis from -80-0.

subplot(2,1,2);
plot(frequencies_given, phase_response_given, 'g', 'linewidth', 1.1);
xlabel('Hz');
ylabel('Phase (rad)');
title('Given FIR Channel Phase Response');
xlim([0,4010]);% X axsis from 0-4010. 
ylim([-5,5]);% Y axsis from -5-5. 
