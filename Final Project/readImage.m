function image = readImage(imgName)

imgVec = imread(imgName);
if(length(size(imgVec)) > 2)
    image = im2double(rgb2gray(imgVec));
else
    image = im2double(imgVec);
end