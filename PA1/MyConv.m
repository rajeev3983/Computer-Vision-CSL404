function output = MyConv(ImageIn, Mask)
Mask = rot90(rot90(Mask));
output = MyCorr(ImageIn,Mask);
end