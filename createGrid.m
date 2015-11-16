function createGrid( R )
% CREATEGRID makes a circular grid with radius R (which determines
% resolution)

R = 11;
global grid;

grid = zeros(2*R);
C = ceil(2*pi*R);
[r,phi] = meshgrid(linspace(R,R,1),linspace(2*pi/C,2*pi,C));
% Find coordinates of boundaries:
X = round(r.*cos(phi));
Y = round(r.*sin(phi));
% Populate boundaries:
for i=1:C
    grid(X(i)+R+1,Y(i)+R+1) = 1000000; % Give boundary large "impedance"
end
imagesc(grid)

end

