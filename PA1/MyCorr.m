function output = MyCorr(ImageIn, Mask)
[rows,cols,color] = size(ImageIn);
[N, M ] = size(Mask);
input = zeros(rows + 2*N -2, cols + 2*M -2,color);
input(N:rows+N-1,M:M+cols-1,:) = ImageIn;
output = zeros(rows + 2*N-2, cols + 2*M -2,color);
K1 = floor(N/2);
K2 = floor(M/2);
for i= N:rows+N-1
    for j = M:M+cols-1
        for k=1:color
            output(i,j,k) = sum(sum(input(i-K1:i+K1,j-K2:j+K2,k).*Mask));
        end
    end
end
output = uint8(output(N:rows+N-1,M:M+cols-1,:));
end