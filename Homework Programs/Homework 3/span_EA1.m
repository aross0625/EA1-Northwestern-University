% Name: Ross, Alexander


function span_EA1(A,b,X1,X2,X3)
%%% Fill in the code for all comments beginning with a single '%'.

% Replace the preceding comment with a comment that describes the function.

% Check that the number of inputs is between 3 (for n=1) and 5 (for n=3)
if nargin == 3 %Checks if there are 3 inputs to the function
    fprintf('The number of inputs is 3');
end

if nargin == 4 %Checks if there are 4 inputs to the function
    fprintf('The number of inputs is 4');
end

if nargin == 5 %Checks if there are 5 inputs to the function
    fprintf('The number of inputs is 5');
end

if nargin ~= 5 && nargin ~= 4 && nargin ~= 3 %Checks if there are not 3,4,or 5 inputs to the function
    error('The proper number of inputs has not been met');
end

% Store the number of rows and columns of A.
m1 = size(A,1); %creates a variable for the number of rows
n1 = size(A,2); %creates a variable for the number of columns

% Check that the dimensions of the vectors are either 2 or 3.
if m1 > 3 || m1 < 2
    % Creates an error message telling the user that the vectors must
    % have dimensions of either 2 or 3
    error('The vector must have dimensions of either 2 or 3.');
end

% Check that the number of vectors is between 1 and 3.
if nargin == 3 %Checks to see if the number of vectors is 1
    fprintf('One vector exists');
end

if nargin == 4 %Checks to see if the number of vectors is 2
    fprintf('Two vectors exists');
end

if nargin == 5 %Checks to see if the number of vectors is 3
    fprintf('Three vectors exists');
end

% Check the dimensions of b.
m2 = size(b,1);
if m2 == m1
    fprintf('the dimensions match');
end

% Check that the number of coefficient arrays matches n.
if n1 == nargin %Checks whether n1 matches the number of inputs
    fprintf('The coefficient arrays match n');
end

if nargin ~= n1 %Checks whether n1 does not match the number of inputs
    fprintf('The coefficient arrays do not match n');
end

% Compute the total number of grid points, and check that
% this number is > 0.
grid_points = zeros(1,n1); %Initializes the gridpoints array
if nargin == 3 %Properly sizes the gridpoints array if there are 3 inputs to the function
    grid_points = size(X1,1); 
    disp(grid_points);
end
if nargin == 4 %Properly sizes the gridpoints array if there are 3 inputs to the function
    grid_points = size(X1,1) * size(X2,1);
    disp(grid_points);
end
if nargin == 5 %Properly sizes the gridpoints array if there are 3 inputs to the function
    grid_points = size(X1,1) * size(X2,1) * size(X3,1);
    disp(grid_points);
end


%%% These statements create the figure and orient the plot.
figure; hold on;

if size(A,1) == 3
    view([-37.5,30]);
    scatter3(0,0,0,'go','LineWidth',3);
elseif size (A,1) == 2
    plot(0,0,'go','LineWidth',3);
end

%%% These statements set up the figure.
%%% You can modify the limits to change the view.
xlim([-2 2]);ylim([-2 2]);zlim([-2 2]);
axis square
xlabel('x1');ylabel('x2');zlabel('x3')

%%% Plot the vectors (v1,...,vn).
for ii = 1:n1
    if m1 == 3
        quiver3(0,0,0,A(1,ii),A(2,ii),A(3,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
    else
        quiver(0,0,A(1,ii),A(2,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
    end
end

leg= legend('Origin','Vectors','AutoUpdate','off');


% Generate an array of points by looping over all possible values 
% of (a1,a2,a3) (for n=3) and computing the corresponding linear combination
% of vectors. Include the cases n=1, 2, or 3.
grid_points = [];
c = [];
if size(A,2) == 1 %case for when n1 is equal to 1
    for ii = 1:length(X1) %Loops over the length of the first vector
        grid_points = [grid_points; X1(ii)]; % Draws together the values from the available vectors
    end
    
    for zz = 1:size(grid_points, 1) %loops over the rows of the grid
        W = A*grid_points(zz,:);%Creates the linear combination
        c = ([c;W']); %Stores the linear combination in a matrix
    end
    
elseif size(A,2) == 2 %case for when n1 is equal to 2
    for ii = 1:length(X1)%Loops over the length of the first vector
        for jj = 1:length(X2)%Loops over the length of the second vector
        grid_points = [grid_points; X1(ii) X2(jj)]; % Draws together the values from the available vectors
        end
    end
    
    for zz = 1:size(grid_points, 1) %loops over the rows of the grid
        W = A*grid_points(zz,:)';%Creates the linear combination
        c = ([c;W']); %Stores the linear combination in a matrix
    end
elseif size(A,2) == 3 %case for when n1 is equal to 3
    for ii = 1:length(X1)%Loops over the length of the first vector
        for jj = 1:length(X2) %Loops over the length of the second vector
            for kk = 1:length(X3)%Loops over the length of the third vector
                 grid_points = [grid_points; X1(ii) X2(jj) X3(kk)]; % Draws together the values from the available vectors
            end
        end
    end
    %computes the linear combination
    for zz = 1:size(grid_points, 1) %loops over the rows of the grid
        W = A*grid_points(zz,:)'; %Creates the linear combination
        c = ([c;W']); %Stores the linear combination in a matrix
    end
end
        
% Print each point using the command "scatter" for m=2, or "scatter3"
% for m=3. Use the "pause" command to slow down the plotting.
if m1 == 2 %Executes the scatter command for when m=2
    for nn = 1:size(c,1) %Loops over all the values of the matrix c to scatter them
        pause(0.1);
        scatter(c(nn,1),c(nn,2));
    end
elseif m1 == 3 %Executes the scatter commands for when m=3
        for nn = 1:size(c,1) %Loops over all the values of matrix c to scatter them
        pause(0.1);
        scatter3(c(nn,1),c(nn,2),c(nn,3));
        end
    
end        
        
        

%%% These statements show the vector "b" as an arrow.
if m1 == 3
    h= quiver3(0,0,0,b(1),b(2),b(3),1.0,'LineWidth',2,'MaxHeadSize',.5,'Color',[1 0 1]);
else
    h= quiver(0,0,b(1),b(2),1.0,'LineWidth',2,'MaxHeadSize',.5,'Color',[1 0 1]);
end
h.DisplayName = 'b';
leg.PlotChildren(end+1) = h;



% Check to see if b is in the span of the columns of A.
% If it is not, then print out a corresponding message.
% If it is, then print the dependence relation:
% b= a1 x v1 + a2 x v2 + a3 x v3
% where (a1,a2,a3) take on the numerical values.

aug = [A b];    
[R,piv] = rref(aug); %Initializes the augmented matrix

r = rank(A);
if rank(aug) == r
        %Assigning the coefficients that correspond to the pivot variables
        %to c. The rest will be 0 since they are not used.
        grid_points(piv) = R(piv,end)';
else
    error('b is not in the span of A')  %b is not in the span. There are no coefficients, just an error message.
end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Test Cases:
% 2D:
% A = [1 0; 1 1]; b = [-1; 0]; X1 = [-2:0.25:2]; X2= [-2:0.5:2];
% A = [1 1; -1 -1]; b = [1; 0]; X1 = [-2:0.25:2]; X2=X1;

% 3D, use the same X1, X2, X3 for all examples:
% A = [0.4 1; -0.4 0; 0.5 1]; b = [-0.3; 0.8; -0.5]; X1= (-5:0.4:5); X2= (-3:0.4:3);
% A = [1 1 1; -1 -1 0; 0 -1 1]; b = rand(3,1); X1= (-2:0.4:2); X2=(-3:0.4:3); X3= X1;
%%% For the following examples use X1= (-3:0.4:3); X2= X1; X3= X1;
% A = rand(3,1); b = rand(3,1);
% A = rand(3,2); b = rand(3,1);
% r = rand(3,2); A = [r 2*r(:,1)]; b = rand(3,1);
