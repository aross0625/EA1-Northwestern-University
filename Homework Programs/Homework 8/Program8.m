function [cs,ns,coords] = Program8(A,b)
% Given a matrix A, this function will find a basis for the column space
% and null space.  The function will also display the dimension for each
% subspace.  If the vector B is within the column space or null space of A,
% the function will calculate the coordinates of that vector

%%%%%%% Find the pivots of A
[R,pivots] = rref(A);
p = length(pivots);
piv_rows = zeros(length(pivots),1);

%%%%%% Initialization of outputs
c = setdiff(1:size(R,2),pivots);
[m,n] = size(A);
cs = zeros(m,p);
ns = zeros(n,length(c));
disp(ns);
coords_cs = [];
coords_ns = [];

%%%%%Generates  the column space of A, and stores this in the current
%%%%%column of the cs matrix
for ii = 1:p
    cs(:,ii) = A(:,pivots(ii));
end

%%%%%% Null space 

Q = -1 * rref([A zeros((size(A,1)),1)]);



for ii = 1:size(ns,2) %ii = p:m
    counter = 1;
    for jj = 1:size(ns,1) %jj = 1:n
        if ismember(jj,c)
            ns(jj,ii) = Q(counter,c(ii)); 
            counter = counter + 1;
        end
%         for kk = 1:length(pivots)
%             if jj == pivots(kk)
%                 ns(jj,ii) = Q(piv_rows(kk), c(n)); 
%             end
%         end
        if ismember(jj,c(ii))
            ns(jj,ii) = 1;
        end
    end
end



%%%%% Display the dimensiosn of the column and null space
fprintf('The dimension of the column space is %i', size(cs,2));
fprintf('\nThe dimension of the null space is %i', size(ns,2));


%%%%%% More initializing
nulltrue = false;
coltrue = false;

%%%%% Check if 'b' has the correct dimensions
if length(b) == size(A,2)
    nulltrue = true;
elseif length(b) == size(A,1)
    coltrue = true;
elseif nulltrue == false && coltrue == false
    fprintf("\nb is not in the column space or null space of A");
end

% 
% % Check if 'b' is in the null space
% if nulltrue == true
%     if ns * b == 0
%         fprintf('\nVector b is in the null space of A');
%     else
%         fprintf('\nVector b is not in the null space of A');
%     end
% end

% elseif (nulltrue == true)
%     if A*b == zeros(size(A,1),1)
%         B = rref([ns b]);
%         coords_ns = [coords_ns B];
%         %coords_ns = [1:size(B,2),end]
%     end


%%%%% Check if 'b' is in the column space//null space and update the coordinates matrix 

if (coltrue == true)
    [J,l] = rref([cs b]);
    X = cs\b;
   if l(end) >= size(cs+1)
        fprintf('\nb is not in the column space of A') ;
   else
        fprintf('\nb is in the column space of A and its coordinates are %i',X);
        coords_cs = [coords_cs X];
   end
    
    
elseif (nulltrue == true)
    [Q,L] = rref([ns b]);
    if ns * b == 0
        coords_ns = ns\b;
        fprintf('\nb is in the null space of A and its coordinates are %i%d',coords_ns);
    else
        fprintf('\nb is not in the null space of A');
    end
    
else
    coords_ns = [];
    coords_cs = [];
end

coords = [coords_ns  coords_cs];

%%%%%%Displays the coordinates 
fprintf('\nThe values of the coordinates are:\n');
fprintf('\n%f', coords);

end








