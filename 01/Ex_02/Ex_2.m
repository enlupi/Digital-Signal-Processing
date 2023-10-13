clear all;
close all; 

% Load audio file 'y_echo.mat'

load('y_echo.mat');
y = y_echo;
Fs = 44100;


% Play audio

%sound(y, Fs);


% Compute autocorrelation and plot the results
% Use grid to find value N

autocorr = xcorr(y, 'coeff');
samples = -(length(y)-1):length(y)-1;

figure;
plot(samples, autocorr);
xlabel('Samples');
ylabel('Auto Correlation');
grid;


% Define N looking at the previous plot

t = 50;
[max_corr, N] = max(autocorr(length(y)+t+1:end));
N = N + t;


% First N samples of x and y coincide

x(1:N)=y(1:N);


% Remove the echo

a = 0.75;
for i=N+1:length(y)
    x(i)=y(i) - a * x(i-N); % Inverse filtering
end


% Plot the original and filtered signal

figure;
subplot(211)

% Plot signal with echo

plot(y); 
title('Signal with Echo');

% Plot signal without echo

subplot(212)
plot(x); 
title('Signal without Echo');


% Reproduce files


% Put pause(5) before and after reproducing files

pause(5);

% Listen to signal with echo
sound(y,Fs);
pause(5);

% Listen to signal without echo
sound(x,Fs);
pause(5);
