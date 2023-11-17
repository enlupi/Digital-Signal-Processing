clear all;
close all;

%Load the audio using audioread() function

[xx, fs] = audioread('SunshineSquare.wav');

%pause(2);
%sound(xx, fs);

%Plot the spectogram in order to find disturbing sinusoidial noise

figure;
spectrogram(xx, fs);

%Define the frequence to notch, the ones you have found on the spectogram

omega1 = 0.9;
omega2 = 1.8;
omega3 = 2.7;

%First impulse response
%Do not forget to normalize to obtain DC unit gain

hh1 = [1, -2*cos(omega1), 1]/(2 - 2*cos(omega1));

%Second impulse response

hh2 = [1, -2*cos(omega2), 1]/(2 - 2*cos(omega2));

%Third impulse response

hh3 = [1, -2*cos(omega3), 1]/(2 - 2*cos(omega3));

%Cascade two by two impulse responses using the convolution

hh_tot = conv(hh1, hh2);
hh_tot = conv(hh_tot, hh3);

%Check the frequency of the final filter by using following lines
ww = -pi:pi/100:pi; 
HH = freqz(hh_tot, 1, ww);

%Plot the overall frequency response 
%Magnitude of impulse response

figure;
plot(ww, 20*log10(abs(HH)));
grid;

%Phase of impulse response

figure;
plot(ww/pi, unwrap(angle(HH)));
grid;

%Filter audio with the final filter

xx_filtered = filter(hh_tot, 1, xx);

%Plot the spectogram of output

figure;
spectrogram(xx_filtered, fs);

%Reproduce original and output-filtered audio

pause(2);
sound(xx, fs);
pause(11);
sound(xx_filtered, fs);
