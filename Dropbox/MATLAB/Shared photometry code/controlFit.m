function [controlFit] = controlFit (dat1, dat2)

reg = polyfit(dat2, dat1, 1);

a = reg(1);
b = reg(2);

controlFit = a.*dat2 + b;

