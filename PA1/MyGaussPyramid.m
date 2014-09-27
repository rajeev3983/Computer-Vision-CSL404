function [] = MyGaussPyramid(ImageIn)
[rows,cols,c] = size(ImageIn);
mask = MyGauss(4,[3,3]);
numPyramids = 5;
figure;
sizeRequired = 0;
Position =[ 0.0 0.2 0.5 0.5; 0.5 0.2 0.25 0.25; 0.75 0.2 0.125 0.125; 0.88 0.2 0.06 0.06; 0.94 0.2 0.03 0.03];
for i=1:numPyramids
    filteredImage = ImageIn;
    for j=1:c
        filteredImage(:,:,j) = MyConv(ImageIn(:,:,j),mask);
    end
    ImageIn = ImageIn(1:2:end,1:2:end,:);
    [ rows, cols, c] = size(ImageIn);
    sizeRequired = sizeRequired + rows*cols*c;
    subplot('Position',Position(i,:));
    imshow(ImageIn);
end
disp(sprintf('Size required to save the images = %d bytes',sizeRequired));
end