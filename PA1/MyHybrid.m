function HybridImage = MyHybrid( Image1, Image2, CutOff1, CutOff2 )
figure;
[ rows, cols, colors ] = size(Image1);
I1 = double(Image1);
I2 = double(Image2);
[rows cols, numcols ] = size(Image1);
for i=1:rows
    for j=1:cols
        I1(i,j,:) = I1(i,j,:)*((-1)^(i+j));
        I2(i,j,:) = I2(i,j,:)*((-1)^(i+j));
    end
end
pI1 = zeros(2*rows,2*cols,colors);
pI1(1:rows,1:cols,:)=I1;
pI2 = zeros(2*rows,2*cols,colors);
pI2(1:rows,1:cols,:) = I2;
I1 = pI1;
I2 = pI2;
I1 = fft2(I1);
I2 = fft2(I2);
H1 = zeros(2*rows,2*cols,colors);
for i=1:2*rows
    for j=1:2*cols
        for k=1:colors
            H1(i,j,k) = (i-rows)^2 + (j-cols)^2;
        end     
    end
end
H2 = H1;
H1 = -H1/(2*CutOff1^2);
H1 = exp(H1);
H2 = -H2/(2*CutOff2^2);
H2 = exp(H2);
lowpass = I1.*H1;
highpass = I2.*(1-H2);
HybridImage = abs(real(ifft2(lowpass + highpass)));
HybridImage = HybridImage(1:rows,1:cols,:);
HybridImage = uint8(HybridImage);
imshow(HybridImage);
end