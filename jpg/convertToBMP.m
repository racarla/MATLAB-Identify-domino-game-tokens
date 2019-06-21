clear all;
close all;
imgList = dir('*.jpg');

for k = 1:numel(imgList)
    S = imgList(k).name;
    %S = S(1:end-4);
    I = imread(S);
    I = imcrop(I,[850, 0, 3650-851, 2100]);
    O = strcat(S(1:end-4),'.bmp');
    imwrite(I,O);
end
