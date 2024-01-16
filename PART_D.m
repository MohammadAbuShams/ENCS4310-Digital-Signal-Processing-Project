%PART D.
%Mahmoud Hamdan 1201134.
%Yazzed Hamdan 1201133.
%Mohammad Abu Shams 1200549.
%SEC2.

%Load the data.
load('css.mat')
%Load the impulse response.
load('path.mat')
%Concatenate Ten blocks of css.
css_concat=repmat(css,1,10);
%Concatenate Ten blocks of css.
far_end_signal=repmat(css,1,10);

concat_Css_10=[css_concat css_concat];
echo_signal=conv(concat_Css_10, path);

M=128;%Taps.
u=0.25;%Step Size.
epsilon=1e-6;
w=zeros(M,1);
y=zeros(size(concat_Css_10));%Echo.
e=zeros(size(concat_Css_10));%Error.

%adaptive line echo canceller.
for n=M:length(far_end_signal)
    x_n=far_end_signal(n:-1:n-M+1).';%tap inputs(column vector).
    y(n)=w' * x_n;%echo replica.
    e(n)=echo_signal(n)-y(n);%error signal.
    w=w+(u/(epsilon+x_n'* x_n))* e(n)* x_n;%update weights.
end

figure;
subplot(3,1,1);
plot(far_end_signal,'y','linewidth',1.2);
xlabel('Tap Index');
ylabel('Amplitude');
title('Far-End Signal');
xlim([0,50000]);% X axsis from 0-50000. 
ylim([-5,5]);% Y axsis from -5-5. 

subplot(3,1,2);
plot(echo_signal,'g','linewidth',1.2);
xlabel('Tap Index');
ylabel('Amplitude');
title('Echo Signal');
xlim([0,50000]);% X axsis from 0-50000. 
ylim([-3,3]);% Y axsis from -3-3. 

subplot(3,1,3);
plot(e,'r','linewidth',1.2);
xlabel('Tap Index');
ylabel('Amplitude');
title('Error Signal');
xlim([0,50000]);% X axsis from 0-50000. 
ylim([-1,1]);% Y axsis from -1-1. 


figure;
subplot(2,1,1);
plot(path,'k','linewidth',1.2);
xlabel('Tap Index');
ylabel('Weight');
title('True Echo Path');
xlim([0,90]);% X axsis from 0-90. 
ylim([-0.25,0.25]);% Y axsis from -0.25-0.25. 

subplot(2,1,2);
plot(w,'b','linewidth',1.2);
xlabel('Tap Index');
ylabel('Weight');
title('Estimated Echo Path');
xlim([0,110]);% X axsis from 0-110. 
ylim([-0.25,0.25]);% Y axsis from -0.25-0.25. 
