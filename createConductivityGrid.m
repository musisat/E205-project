% createConductivityGrid.m
% We start with impedances and then convert to conductivity based on the
% size of grid points.
% MAKE A FUNCTION AND ADD A WAY TO CHOOSE WHICH DOMAIN TO USE

global conductivityGrid radius

% We are going to have to determine the size of each cell.
% May need to assign separate values for impedance and phase or the
% individual resistors and capacitor in the Cole-Cole model.

% Homogeneous domain:
% For now assume 0.025 ohm per cell.
% I don't know if complex impedance matters.
% Cycle over entire matrix insert impedance values inside the boundary.
% Cells outside the boundary should have infinite impedance.
% impedance = 0.025;
% cellLength = 30e-6; % For now assume 30 microns.
% resistivity = impedance*cellLength;
% conductivity = 1/resistivity;
% 
% for i=1:2*radius
%     for j=1:2*radius
%         if sqrt((i-radius-1)^2+(j-radius-1)^2) < radius
%             conductivityGrid(i,j) = conductivity;
%         else
%             conductivityGrid(i,j) = 0; % We may need to adjust the boundary.
%         end
%     end
% end
% imagesc(conductivityGrid)

% Non-homogeneous domain! Determine conductivities probabilistically. They
% should all be pretty close to each other.
meanImpedance = 0.025;
cellLength = 30e-6; % For now assume 30 microns.

for i=1:2*radius
    for j=1:2*radius
        if sqrt((i-radius-1)^2+(j-radius-1)^2) < radius
            impedance = normrnd(meanImpedance,0.01);
            if impedance<0
                impedance = meanImpedance;
            end
            resistivity = impedance*cellLength;
            conductivity = 1/resistivity;
            conductivityGrid(i,j) = conductivity;
        else
            conductivityGrid(i,j) = 0; % We may need to adjust the boundary.
        end
    end
end
imagesc(conductivityGrid)

% Non-homogeneous domain! Create a way to add a feature to the domain with
% a plausible conductivity distribution. Maybe add the lungs.