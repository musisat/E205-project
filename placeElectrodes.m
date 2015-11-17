function placeElectrodes( numElectrodes, electrodeSize )
%NUMELECTRODES will place the given number of electrodes evenly around the
% grid boundary and keep track of which two electrodes are injecting the
% current signal ("drive electrodes"). Electrode size is the ratio of
% electrode width to radius. numElectrodes must be an even number.

global radius C boundXind boundYind potentialGrid
global driveX % x coordinates of drive electrodes
global driveY % y cooridnates of drive electrodes
global sensingX % x coordinates of sensing electrodes
global sensingY % y coordinates of sensing electrodes

electrodeWidth = ceil(electrodeSize*radius);
space = floor(C/numElectrodes - electrodeWidth); % spacing between electrodes
% Will need to designate drive electrodes, possibly with a separate array
% of locations.

driveX = [boundXind(1:electrodeWidth); boundXind(electrodeWidth+space+1:2*electrodeWidth+space)];
driveY = [boundYind(1:electrodeWidth); boundYind(electrodeWidth+space+1:2*electrodeWidth+space)];
for k=1:electrodeWidth
    potentialGrid(driveX(1,k),driveY(1,k)) = 750000;
    potentialGrid(driveX(2,k),driveY(2,k)) = 750000;
end

% Allocate arrays for sensing electrodes
sensingX = zeros(numElectrodes-2,electrodeWidth);
sensingY = sensingX;

% Assign coordinates of sensing electrodes
% for i=1:numElectrodes-2
%     sensingX(i,:) = boundXind(i*(2*electrodeWidth+space)+1:i*(2*electrodeWidth+space)+electrodeWidth+1);
%     sensingY(i,:) = boundYind(i*(2*electrodeWidth+space)+1:i*(2*electrodeWidth+space)+electrodeWidth+1);
%     potentialGrid(sensingX(i,:),sensingY(i,:)) = 500000;
% end

% Plot the electrodes to check
imagesc(potentialGrid)

end

