function createGrid( R )
%CREATEGRID makes a circular grid with radius R (which determines
% resolution)

% WILL NEED A DATA STRUCTURE TO KEEP TRACK OF EACH CELL.
% Could also have list of locations of electrodes.
% Will need separate grids for potential and conductivity of each cell.
% Conductivity is the reciprocal of resistivity, which has units of ohm*m.

global potentialGrid;
global conductivityGrid;
global boundX;
global boundY;
global boundXind;
global boundYind;

potentialGrid = zeros(2*R); % Might need to change this to something more relevant.
conductivityGrid = ones(2*R); % Boundary will be zeros.
C = ceil(2*pi*R);
[r,phi] = meshgrid(linspace(R,R,1),linspace(2*pi/C,2*pi,C));

% Find coordinates of boundaries:
boundX = round(r.*cos(phi));
boundXind = boundX + R + 1;
boundY = round(r.*sin(phi));
boundYind = boundY + R + 1;

% Populate boundaries:
for i=1:C
    potentialGrid(boundXind(i),boundYind(i)) = 1000000; % Give boundary large voltage.
    conductivityGrid(boundXind(i),boundYind(i)) = 0;
end

end

