
Full = [426	427	426	429	432	429	433	433	429	425	435	431	439	437	437	441	438	438	442	443	447	444	446];
TBW = findTBWfromImpedance(Full);
Local = [65 64 65 65 64 65 67 67 67 68 70 72 72 73 71 70 71 72 71 72 73 73 73];
phaseLocal = [4.6 4.8 4.6 4.6 4.5 4.7 4.7 4.3 4.8 4.8 4.6 4.4 4.5 4.3 4.9 4.4 4.7 4.6 4.5 4.5 4.2 4.5 4.4];
R = Local.*cos(phaseLocal.*pi/180);
resistivity = R*11*0.01;
corrLocalFull = corr(Local',Full');
maxTBW = max(TBW)
minTBW = min(TBW)
maxI = find(TBW==maxTBW);
minI = find(TBW==minTBW);
maxResistivity = resistivity(maxI)
minResistivity = resistivity(minI)

