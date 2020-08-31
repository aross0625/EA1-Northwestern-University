
function Vnew = transform_mesh(A,V,T,C)
%TRANSFORM_MESH This function transforms matrix V into Vnew
% Inputs: matrix A, matrix V, matrix T, matrix C
% Matrix A is the transformation matrix
% Matrix V is the transformed matrix
% Matrix T is the triangle matrix
% Matrix C is the color matrix
% Outputs: Vnew is the new, transformed matrix of matrix V

% Homework Program 7
%
% Name: Alexander Ross
% Section: 12
% Date: 11/11/2018

% Validates that A is a 3x3 matrix
validateattributes (A,{'numeric'},{'size',[3 3]} ,1);

% Validates that V is a 4x3 matrix
validateattributes (V,{'numeric'},{'ncols' 3, '2d'} ,2);

% Validates that T is a 4x4 matrix that is nonneggative, an integer, and
% satisfies  0<=T<=4
validateattributes (T,{'numeric'},{'ncols' 4, '>=' 1, 'nonnegative', '2d'}, 3);

% Validates that C is a 4x3 matrix that is nonneggative and
% satisfies  0<=C<=1
validateattributes (C,{'numeric'},{'ncols' 3, 'nonnegative', '>=' ,0, '<=' ,1, '2d'} , 4);

% Apply the linear transformation of A to each element in V
Vnew = V;
for ii = 1:size(V,1)
    Vnew(ii,:) = A * V(ii,:)';
end

% Plot the new and original meshes

if nargin < 4
% If there are less then the 4 inputs
trisurf(T(: ,1:3) ,Vnew (: ,1),Vnew (: ,2),Vnew (: ,3));
hold on
trisurf(T(: ,1:3) ,V(: ,1),V(: ,2),V(: ,3), ...
'EdgeColor','none','FaceAlpha' ,0.2);
hold off 
colormap(C);
axis equal;

else
% If there are enough specified inputs
trisurf(T(: ,1:3) ,Vnew (: ,1),Vnew (: ,2),Vnew (: ,3),T(: ,4));
hold on
trisurf(T(: ,1:3) ,V(: ,1),V(: ,2),V(: ,3),T(: ,4), ...
'EdgeColor','none','FaceAlpha' ,0.2);
hold off
colormap(C);
axis equal;
end


A_scale = [2 0 0; 0 2 0; 0 0 0.5];
A_refl = [-1 0 0; 0 1 0; 0 0 1];
A_rot = vrrotvec2mat([1; 1; 0; pi/6]);
B = A_refl *  A_scale * A_rot;
A = A_rot * A_refl * A_scale;


