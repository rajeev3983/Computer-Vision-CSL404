function [] = TestScript()
pyramidImage = imread('Samples/dog.bmp');
MyGaussPyramid(pyramidImage);
I1 = imread('lena.jpg');
I2 = imread('monalisa.jpg');
result1  = MyHybrid(I1, I2,70, 50 );
I3 = imread('fan.jpg');
I4 = imread('chair.jpg');
result2 = MyHybrid(I3,I4,20,50);
end