% Redefining A, b and a from sec2_2
A = [
2 9 0 0;
0 4 1 4;
7 5 5 1;
7 8 7 4]

b = [
-1;
6;
0;
9]

a = [3 -2 4 -5]
% 1. Construct a randomly generated 2-by-2 matrix of positive integers. 

rand(2, 2)

ans =

    0.8147    0.1270
    0.9058    0.9134

% 2. Find the maximum and minimum elements in the matrix A. 

max(A)

ans =

     7     9     7     4

min(A)

ans =

     0     4     0     0

% 3. Sort the values of the vector b. 

sort(b)

ans =

    -1
     0
     6
     9

% 4. 
% (a) Find the eigenvalues and eigenvectors of the matrix B = A^–1. Store the eigenvalues in a column vector 
% you should name lambda.

B = inv(A)

B =

   -0.0727    0.4255    0.7855   -0.6218
    0.1273   -0.0945   -0.1745    0.1382
   -0.0000   -0.6000   -0.8000    0.8000
   -0.1273    0.4945    0.3745   -0.3382

lambda = eig(B)

lambda =

  -1.4300 + 0.0000i
   0.0271 + 0.1881i
   0.0271 - 0.1881i
   0.0704 + 0.0000i



% (b) With I the 4-by-4 identity matrix, calculate the determinant of the matrix B – lambdaj I , 
% for j = 1, 2, 3, 4. (Note: lambda1 is the first eigenvalue, lambda2 is the second eigenvalue etc.)

% Instead of pre-declaring a I identity matrix variable, eye(4, 4) has been
% used to create the same result
for j = 1:4 
    det_value = det(B - lambda(j)*eye(4, 4))
end;

det_value =

   3.0097e-15


det_value =

  -1.1713e-17 + 5.5825e-18i


det_value =

  -1.1713e-17 - 5.5825e-18i


det_value =

  -4.6961e-18