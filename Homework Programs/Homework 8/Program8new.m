function [cs,ns,coords_cs] = Program8new(A,b)
% Given a matrix A, this function will find a basis for the column space
% and null space.  The function will also display the dimension for each
% subspace.  If the vector B is within the column space or null space of A,
% the function will calculate the coordinates of that vector

%%%%%%% Find the pivots of A
[R,pivots] = rref(A);

%%%%%% Initialization of outputs
SetSize = 1:size(A,2);
c = setdiff(SetSize,pivots);
[m,n] = size(A);

%%%%%Generates  the column space of A, and stores this in the current
%%%%%column of the cs matrixcs = zeros(size(A,1),1);
for jj = 1:size(pivots,2)
    cs(:,jj) = A(:,pivots(1,jj));
end

%%%%%% Null space 
ns = zeros(size(A,2),size(c,2));
for jj = 1:size(c,2)
    counter = 1;
    for ii = 1:n
        if ii == c(1,counter)
            ns(ii,counter) = 1;
            counter = counter + 1;
        elseif ismember(ii,pivots)
            ns(ii,jj) = -[R(find(pivots==ii,1),c(1,jj))]; 
        end
    end
end
    
%%%%% Display the dimension of the column and null space

fprintf('The column space is %.2f \n', size(cs,2));
fprintf('The null space is %.2f \n', size(ns,2));


%%%%%% More initializing
null = false;
colspace = false;


%%%%% Check if 'b' has the correct dimensions
if length(b) == size(A,2)
    null = true;
end
if length(b) == size(A,1)
    colspace = true;
end
if null == false && colspace == false
    fprintf('Vector b is not in the column space and the null space\n');
end

%%%%% Check if 'b' is in the column space//null space and update the coordinates matrix 

coords_cs = [];
coords_ns = [];

if null == true
    if A * b == 0
        coords_ns = ns\b;
        fprintf('b is in the null space of A and the coordinates are\n');
        fprintf('%.2f\n', coords_ns);
    else    
        fprintf('b is not in the null space of A\n');
    end
end

if colspace == true
    ColAug = [cs b];
    [J,l] = rref(ColAug);
    if  l(end) == size(ColAug,2)
        fprintf('b is not in the column space of A');
    else
        coords_cs = cs\b;
        fprintf('b is in the column space of A and the coordinates are\n');
        fprintf('%.2f\n', coords_cs);
    end
else
end

coords_cs = [coords_cs coords_ns];

end