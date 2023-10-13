% Decoding a Universal Product Code (UPC)


clear all; 
close all; 

% Read the image


% Select specific row of the figure

% Make 1D signal 


% Plot 1D signal



% Specify filter coefficients and filter using conv
% 1 * y(n) = 1 * x(n) - 1 * x(n - 1)
% First difference filter 




% Threshold Operator

% threshold = 10 % Found observing the data


% Create sparse detected signal d by comparing magnitude of the y with
% treshold

% Plot the sparse signal


% Convert to Locations



% Apply a first-difference filter to the location signal


% Plot l signal and delta_n


% Estimate the pixel width of the thinnest bar

% Normalize Delta_n by the estimated w_b



% Round the obtained values





% Decode to digits  

% Display obtained results

