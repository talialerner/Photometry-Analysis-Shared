function [normDat] = deltaFF (dat1, controlFit)
    
normDat = (dat1 - controlFit)./ controlFit; %this gives deltaF/F
normDat = normDat * 100; % get %