function createGrid( R )
%CREATEGRID makes a circular grid with radius R (which determines
% resolution)

% WILL NEED A DATA STRUCTURE TO KEEP TRACK OF EACH CELL.
% Might need three separate grids for impedance, current, and potential.

R = 11;
global grid;
global boundX;
global boundY;
global boundXind;
global boundYind;

grid = zeros(2*R);
C = ceil(2*pi*R);
[r,phi] = meshgrid(linspace(R,R,1),linspace(2*pi/C,2*pi,C));

% Find coordinates of boundaries:
boundX = round(r.*cos(phi));
boundXind = boundX + R + 1;
boundY = round(r.*sin(phi));
boundYind = boundY + R + 1;

% Populate boundaries:
for i=1:C
    grid(boundXind(i),boundYind(i)) = 1000000; % Give boundary large "impedance"
end
imagesc(grid)

end
