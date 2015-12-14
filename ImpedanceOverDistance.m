
% Raw data, TBW measured in liters. Each data point represents the average
% of three data points taken at one time point, with given standard
% deviation between the three points.
TBW=[30.9,30.77,31.6,29.33,29.53,30.2,30.47,30.3,30.13];
local13=[75.33,75.667,56,74,77,81.33,70,69,78];
local14=[50.667,50.33,45.33,59,58.667,66,60,61,68.33];
local15=[42,43,52.667,51.33,54,50.33,50.667,59];
local16=[36.5,35.33,39,39,44.33,50.33,43.667,39.667,51.667];

% Phase:
ph13 = [3.95,4.633,4,5.133,3.867,5,4.3,3.967,4.8].*pi/180;
ph14 = [5,5.33,4.5,5.4,4.7,5.567,5.433,5.533,4.767].*pi/180;
ph15 = [5.7,3.567,6.033,4.7,6.533,6.167,5.967,5.867].*pi/180;
ph16 = [8.4,6.433,5.133,5.967,4.8,6.067,6.733,7.7,5.967].*pi/180;

% Simple resistances (real part of impedance):
R13 = local13.*cos(ph13);
R14 = local14.*cos(ph14);
R15 = local15.*cos(ph15);
R16 = local16.*cos(ph16);

% Average values for each distance. (We don't care about TBW here.)
ave13 = mean(R13);
ave14 = mean(R14);
ave15 = mean(R15);
ave16 = mean(R16);

figure(1)
plot([13,14,15,16],[ave13,ave14,ave15,ave16],'o')
corrDist = corr([13,14,15,16]',[ave13,ave14,ave15,ave16]');
resistivity1 = (0.01*[13,14,15,16].*[ave13,ave14,ave15,ave16])

% Another iteration on different data:
Four11_nathan = [46,51.667,44.33];
Four12_nathan = [44.667,32.33,40.33];
Four13_nathan = [33.33,32,26];
Four14_nathan = [29.667,24.33,21.667];

% Phase:
ph11 = [7.13,7.77,5.87].*pi/180;
ph12 = [8.97,8.43,7.43].*pi/180;
ph13_2 = [9.6,8.17,7.63].*pi/180;
ph14_2 = [9.13,8.8,8.5].*pi/180;

% Resistance:
R11 = Four11_nathan.*cos(ph11);
R12 = Four12_nathan.*cos(ph12);
R13_2 = Four13_nathan.*cos(ph13_2);
R14_2 = Four14_nathan.*cos(ph14_2);

ave11 = mean(R11);
ave12 = mean(R12);
ave13_2= mean(R13_2);
ave14_2 = mean(R14_2);

figure(2)
plot([11,12,13,14],[ave11,ave12,ave13_2,ave14_2],'o')
resistivity2 = (0.01*[11,12,13,14].*[ave11,ave12,ave13_2,ave14_2])

