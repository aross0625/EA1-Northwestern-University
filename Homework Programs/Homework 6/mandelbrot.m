% Homework Program 4%
% Name:       Ross, Alexander
% Section:    30
% Date:       10/23/2018

function [EscTime, EscVal, Image] = mandelbrot(limits, nx, ny, maxEscTime)

if ~exist('limits', 'var') || isempty(limits)
    limits = [-2.0 0.5 -1.2 1.2];
end

if ~exist('nx', 'var') || isempty(nx)
    nx = 1000;
end

if ~exist('ny', 'var') || isempty(ny)
    ny = 1000;
end

if ~exist('maxEscTime', 'var') || isempty(maxEscTime)
    maxEscTime = 1000;
end

x = linspace(limits(1),limits(2),nx);
y = linspace(limits(4),limits(3),ny);

[X,Y] = meshgrid(x,y);
C = X + 1i*Y;

%1
EscTime = Inf(ny,nx);
EscVal = NaN(ny,nx);

%2
Z = zeros(ny,nx);

%3
done = false(ny,nx);

%4
k = 0;

%5
while (k < maxEscTime) && (~all(done(:)))
    Z = Z.*Z + C;
    k = k + 1;
    new = (abs(Z) > 2) & (done == false);
    EscTime(new) = k;
    EscVal(new) = abs(Z(new));
    done = done | new;
end

% Plot result as a color image%
Image = showMandelbrot(EscTime,EscVal,limits);









