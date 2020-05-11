clc;
close all;
clear all;
%
img = imread('Tomates_Eq6_RGBtupla_190,40,15.JPG');
% tuple = 190;40;15 | #BE280F
% color triad from https://color.adobe.com/create
% triad01 = 142, 191, 34 | #8EBF22 green-ish
% triad02 = 3, 42, 115 | #032A73 blue-ish
% 
alpha = [38/51, 8/51, 1/17]';
beta = [1/85, 14/85, 23/151]';
gamma = [142/255, 191/255, 2/15]';

T = [alpha, beta, gamma];
T = T/norm(T);

img_red = img(:,:,1);
img_green = img(:,:,2);
img_blue = img(:,:,3);

pixel = [0;0;0];

 for(i=1:size(img, 1))
     for (j=1:size(img, 2))
         pixel(1) = img(i,j,1);
         pixel(2) = img(i,j,2);
         pixel(3) = img(i,j,3);
         pixel = inv(T) * pixel;
         img_red(i,j) = pixel(1);
         img_green(i,j) = pixel(2);
         img_blue(i,j) = pixel(3);
     end
 end
 
 img_red = uint8(img_red);
 img_blue = uint8(img_blue);
 img_green = uint8(img_green);
 
 figure(1)
 subplot(2,2,1)
 imshow(img)
 title('Imagen original')
 
 subplot(2,2,2)
 imshow(img_red)
 title('#BE280F | Tupla asignada')
 
 subplot(2,2,3)
 imshow(img_green)
 title('#8EBF22')
 
 subplot(2,2,4)
 imshow(img_blue)
 title('#032A73')
 