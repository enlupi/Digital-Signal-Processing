% Decoding a Universal Product Code (UPC)


clear all; 
close all; 

% Read the image

img = imread('upca5.gif');
imshow(img)


% Select specific row of the figure

r = 10;


% Make 1D signal 

R = img(r, :);


% Plot 1D signal

figure;
plot(R);
xlabel('Samples');
ylabel('x[n]');


% Specify filter coefficients and filter using conv
% 1 * y(n) = 1 * x(n) - 1 * x(n - 1)
% First difference filter 

filter = [1, -1];
y = conv(R, filter, 'valid');


% Threshold Operator
% threshold = 10 % Found observing the data

d = y;
tau = 10;


% Create sparse detected signal d by comparing magnitude of the y with
% treshold

d(abs(y) <  tau) = 0;
d(abs(y) >= tau) = 1;


% Plot the sparse signal

figure;
stem(d, '-*');
xlabel('Samples');
ylabel('d[n]');


% Convert to Locations

l = find(d);


% Apply a first-difference filter to the location signal

delta_n = conv(l, filter, 'valid');


% Plot l signal and delta_n

figure()
subplot(2,1,1);
stem(delta_n);
ylabel('delta n');
xlabel('Samples');
subplot(2,1,2);
stem(l);
ylabel('l[n]');
xlabel('samples');


% Estimate the pixel width of the thinnest bar

w_b = sum(delta_n)/95;


% Normalize Delta_n by the estimated w_b

delta_n = delta_n/w_b;


% Round the obtained values

barcodearray = round(delta_n);


% Decode to digits  

decodeUPC(barcodearray);


% Display obtained results

disp(ans)
