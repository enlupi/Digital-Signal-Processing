clear all;
close all;

%Load the image 'eleph2.jpg'

img = imread("eleph2.jpg");


%Plot the original image

imshow(img)


%Convert from RGB to gray scale and then to double

BW_img = double(rgb2gray(img));


%Plot the Black and White image

figure, imagesc(BW_img); colormap(gray); title("B&W Image")


%Define the window dimension, first try with window size 3x3, after change
%window size and see what will happen if we increase sliding window

N = 3;
filter = ones(N)/N^2;


%Define the matrix containg the result, creating matrix of zeros of
%original image size

var = zeros([800 1600]);


%Zero padding

padded_img = padarray(BW_img, [1 1]);


%Compute local variance of the image and save results in matrix defined to
%cointain results

var = conv2(padded_img.^2, filter, 'valid') - ...
      conv2(padded_img, filter, 'valid').^2;


%Plot resulting matrix which cointains local variance

figure, imagesc(var); colormap(gray); title("Local Variance")


%Define a Threshold

t = mean(var, 'all');


%Set the pixel values based on threshold

var(var < t) = 0;

%Plot detected edges

figure, imagesc(var); colormap(gray); title("Detected Edges")

