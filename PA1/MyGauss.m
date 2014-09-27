function GaussMask = MyGauss( Sigma, Size )
rows= Size(1);
cols = Size(2);
GaussMask = zeros(rows,cols);
CentreX = floor(rows/2)+1;
CentreY = floor(cols/2)+1;
for i=1:rows
    for j=1:cols
        GaussMask(i,j) = ( ( i-CentreX)^2 + (j-CentreY)^2 );
    end
end
GaussMask = -GaussMask/(2*Sigma^2);
GaussMask = exp(GaussMask)/(2*pi*Sigma^2);
sm = sum(sum(GaussMask));
GaussMask = GaussMask/sm;
end