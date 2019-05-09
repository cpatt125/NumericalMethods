%% LU Algorithm
% By: Cary Patterson
%This function determines the LU Factorization of a square matrix.
%The user will input a matrix consisting of the coefficients belonging to a
%system of equations.
%The function will output the lower triangular matrix, upper triangular
%matrix, and the pivot matrix.
%Input Variable
%   A = the matrix of coefficients 
%Output Variables 
%   L = the lower triangular matrix
%   U = the upper triangular matrix
%   P = the pivot matrix

function [L,U,P]=luFactor(A)

%Defining the upper triangular matrix as equal to A
%Defining variable x for size of n x n matrix
%Defining variable y for use in the current row/column
%Defining variable z for use in the elimination of the current column
%Starting matrices L and P as identity matrices

U = A;
x = rank(U);
y = 0;
z = 1;
L = eye(x);
P = eye(x);

size_matrix = size(U); %Checks to make sure the user inputed a true n x n matrix otherwise throws and error
if size_matrix(1) ~= size_matrix(2)
    error('The inputed matrix is not an n x n matrix. Rows and columns must have the same length')
else
end
while U(x,x-1) ~= 0 %while loop ends when the 2nd to last number in the last row equals zero
    [~,row] = max(abs(U((y+1):x,y+1))); %finds the largest integer in the column and tells which row it is in
    if row+y ~= (y+1)
        U_pivot = U(y+1,:);% pivots the upper triangular matrix 
        U(y+1,:) = U(row+y,:);
        U(row+y,:) = U_pivot;
        P_pivot = P(y+1,:);% pivots the pivot matrix from its original identity matrix
        P(y+1,:) = P(row+y,:);
        P(row+y,:) = P_pivot;
    else 
    end
    while U(x,y+1) ~= 0 % while loop ends when the last number in the column is zero
        L(z+(y+1),y+1) = (((U(z+(y+1),y+1))./(U((y+1),(y+1))))); %replaces the zero in the lower triangular matrix with the factor used to eliminate the number in the U matrix
        U(z+(y+1),:) = U(z+(y+1),:)-(((U(z+(y+1),y+1))./(U((y+1),(y+1)))).*(U(y+1,:))); %the new row is (old row)-(first row).*(number in diagonal)/(number to be eliminated) 
        z = z+1; %adds one to the row so the for loop can move down the column to eliminate 
    end
    if row+y ~= (y+1)
        L_pivot = L(y+1,y+1);% pivots the upper triangular matrix 
        L(y+1,y+1) = L(row+y,y+1);
        L(row+y,y+1) = L_pivot;
    else
    end
    y = y+1; %adds one to the scalar y in order to move down rows and columns in the next loop
    z = 1; %resets the value of z to 1 so that the elimination step works properly in next iteration
end

L 
U
P

end

