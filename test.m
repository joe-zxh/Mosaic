clc;clear;
%cut the mergePic

i = 10;

a = imread('./inputPics/0.jpg');
b = imread('./inputPics/3.jpg');

a = imresize(a, [size(b,1), size(b,2)]);

c = [a,b];%�������Ǻ���ƴ�ӣ����Ҫ����ƴ�ӵĻ��ͽ����Ÿĳɷֺ�
imshow(c)

