function placeElectrodes( numElectrodes, electrodeSize )
%NUMELECTRODES will place the given number of electrodes evenly around the
% grid boundary and keep track of which two electrodes are injecting the
% current signal ("drive electrodes"). Electrode size is the ratio of
% electrode width to radius. numElectrodes must be an even number.

global radius C
global driveX % x coordinates of drive electrodes
global driveY % y cooridnates of drive electrodes

electrodeWidth = ceil(electrodeSize*radius);
space = floor(C/numElectrodes - electrodeWidth); % spacing between electrodes
% Will need to designate drive electrodes, possibly with a separate array
% of locations.
driveX = [];
driveY = [];


end

