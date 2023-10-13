clear all;
close all;

%Load the image 'eleph2.jpg'


%Plot the original image


%Convert from RGB to gray scale and the to double


%Plot the Black and White image

%Define the window dimension, first try with window size 3x3, after change
%window size and see what will happen if we increase sliding window



%Define the matrix containg the result, creating matrix of zeros of
%original image size


%Zero padding


%Compute local variance of the image and save results in matrix defined to
%cointain results


%Plot resulting matrix which cointains local variance



%Define a Threshold



%Set the pixel values based on threshold



%Plot detected edges

