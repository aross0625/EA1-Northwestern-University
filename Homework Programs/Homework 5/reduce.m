% Homework Program 5
% Name: Ross, Alexander
% Date: 10-31-18

function red = reduce(M) %This function will perform row reduction on the matrix M
%i1 = M(:,1); %Sets the rows element
%i2 = M(1,:); %Sets the columns element
k = 0;

for ii = 1:(size(M,1)-1) % If statement for checking the size
    col = col + 1;
    if k > size(M,2)
        red = M
        return;
    end
    
        
if M(ii,k)==0 %Loop for the counter
    set = 0; %initializes the set
    while set == 0 %Loops the set
        y = M(ii:end,k); %Sets y as the matrix M of rows ii:end and columns k
        x = find(y,1) + ii -1; %sets what ever is found in y to ii -1
        if isempty(x) %checks to see if previous line is empty
            k = k + 1 %Adds a count
            if k > size(M,2)
                red = M
                return;
            end
        else
            M = exchange(M,ii,x);
            set = 1
        end
    end
end
    
if M(ii,k) ~= 0
    M = divide(M,M(ii,k),ii);
end

for jj = (ii+1):size(M,1)
    if M(jj,k) ~= 0
        M = add(M, -(M(jj,k)), ii, jj);
    end
end

red = M;

end

end %End of reduce function




function exchange = exchange(M, i1, i2)

% Explanation for 'exchange': This code produces as a result the same matrix except with rows i1 and i2 exchanged. 
% If only one row is given then that row is exchanged with the first row. 
% If neither i1 nor i2 is given, then the program exchanges the first and second rows of M

if nargin == 3 % If statement for if all elements of the function are there
    M([i1, i2], :) = M([i2, i1], :); %switches the rows i2 and i1
    fprintf('Rows %i and %i have been switched',i1,i2); %explains what happens to the user
end

if nargin == 2 % If statement for if i2 does not exists
    M([1, i1], :) = M([i1, 1], :); %switches the rows 1 and i1
    fprintf('Rows %i and %i have been switched', i1, M(1)); %explains what happens to the user
end

if nargin == 1 || nargin == 0 % If statement for if only M or nothing exists
    M([2, 1], :) = M([1, 2], :); %switches the rows 2 and 1 
    fprintf('Rows %i and %i have been switched', M(1), M(2)); %explains what happens to the user
end

exchange = M;

end %End of function exchange





function divide = divide(M,d,i)

if exist('M', 'd', 'i', 'var') %if statement for the divide operation if all inputs are given
    M(i,:) = M(i/d, :); %performs the divide operation 
    fprintf('The final divisor is %i',M(i,:)); %explains what happens to the user
end

if (exist('M', 'd', 'var') && ~exist('i','var')) %if statement for the divide operation if 'i' is not given
    M(1,:) = M(1/d, :); %performs the divide operation 
    fprintf('The final divisor is %i',M(1,:)); %explains what happens to the user
end

divide = M;

end %End of function divide




function add = add(M, r, i1, i2)
% This function will perform the operation r*i1+i2 = i2 on the matrix M

if nargin == 4 %Performs the above operation if all elements are given
    M(i2,:) = M((r*i1)+i2,:);
    fprintf('The following product was created: %i',M(i2,:));
end

if nargin == 3 %Performs the above operation if only the row specifications is given
    M(i2,:) = M((r*1)+i2,:);
    fprintf('The following product was created: %i',M(i2,:));
end

if nargin == 1 || nargin == 2 %Performs the above operation if only the column specifications is given
    M(i1,:) = M((r*1)+i1,:);
    fprintf('The following product was created: %i',M(i1,:));
end

add = M;

end %End of function add
% Your results as comments at the end of the file



