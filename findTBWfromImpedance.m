function [ TBW_out ] = findTBWfromImpedance( impedance_in )
% TBW in liters for Nathan's data

% Establish linear relationship between TBW and impedance:
% TBW = [49.3,48.5,48.6,48.2,47.9,47.8,48,47.9,50.4,50.2,50,50.2];
% imp = [436,448,447,453,457,459,456,457.3,420,422,425,422.33];
% plot(imp,TBW,'o')
% y = -0.066*x + 78

TBW_out = -0.066.*impedance_in + 78;

end

