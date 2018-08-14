clc;clear;
%cut the mergePic

i = 10;

a = imread('./inputPics/0.jpg');
b = imread('./inputPics/3.jpg');

a = imresize(a, [size(b,1), size(b,2)]);

c = [a,b];%这个结果是横向拼接，如果要纵向拼接的话就将逗号改成分号
imshow(c)

