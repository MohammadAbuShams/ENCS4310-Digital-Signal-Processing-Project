%PART C.
%Mahmoud Hamdan 1201134.
%Yazzed Hamdan 1201133.
%Mohammad Abu Shams 1200549.
%SEC2.
%Load the data.
load('css.mat')
%Load the impulse response.
load('path.mat')

%Concatenate five blocks of css.
css_concat=repmat(css,1,5);

%Plot the far-end signal.
figure;
plot(css_concat,'y','linewidth',1.2);
title('Far-end signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0,29000]);% X axsis from 0-29000. 
ylim([-5,5]);% Y axsis from -5-5. 

%Feed the concatenated signal into the echo path.
echo_signal=conv(css_concat,path);

%Plot echo signal.
figure;
plot(echo_signal,'r','linewidth',1.2);
title('Echo Signal');
xlabel('Samples');
ylabel('Amplitude');
xlim([0,29000]);% X axsis from 0-90. 
ylim([-5,5]);% Y axsis from 0-90. 


%Estimate the input and output powers in dB.
Ncss=length(css_concat);
Necho=length(echo_signal);
Pin=10*log10(sum(css_concat.^2)/Ncss);
Pout=10*log10(sum(echo_signal.^2)/Necho);

%Evaluate the echo return loss (ERL).
ERL=Pin-Pout;


fprintf('Input Power= %g dB\n',Pin);
fprintf('Output Power= %g dB\n',Pout);
fprintf('Echo Return Loss (ERL)= %g dB\n',ERL);
