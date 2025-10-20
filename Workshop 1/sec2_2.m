% 1. Calculate the following (when defined)
A = [
2 9 0 0;
0 4 1 4;
7 5 5 1;
7 8 7 4]

% Defining Matrices
A =

     2     9     0     0
     0     4     1     4
     7     5     5     1
     7     8     7     4

b = [
-1;
6;
0;
9]

b =

    -1
     6
     0
     9

a = [
3 -2 4 -5]

a =

     3    -2     4    -5
% ----------------------

% (a) A * b

A*b

ans =

    52
    60
    32
    77

% (b) a + 4

a + 4

ans =

     7     2     8    -1

% (c) b*a

b*a

ans =

    -3     2    -4     5
    18   -12    24   -30
     0     0     0     0
    27   -18    36   -45

% (d) a * b^T

a.*b'

ans =

    -3   -12     0   -45

% (e) A * a^T
A.*a'

ans =

     6    27     0     0
     0    -8    -2    -8
    28    20    20     4
   -35   -40   -35   -20

% 2. Explain any differences between the answers that MATLAB gives when you type in A*A, A^2 and A.^2. 

A*A

ans =

     4    54     9    36
    35    53    37    33
    56   116    37    29
    91   162    71    55

A^2

ans =

     4    54     9    36
    35    53    37    33
    56   116    37    29
    91   162    71    55

% A*A and A^2 produce the same result due to A^2 evaluating to A*A, therefore their result's are identical.

A.^2

ans =

     4    81     0     0
     0    16     1    16
    49    25    25     1
    49    64    49    16

% A.^2 produces a different result by using element-wise multiplication with the '.' operator.

% 3. What is the command that isolates the submatrix that consists of the 2nd to 3rd rows of the
matrix A?

A(2:3, :)

ans =

     0     4     1     4
     7     5     5     1

% 4. Solve the linear system A x = b for x. Check your answer by multiplication. 
A \ b

x = A \ b

x =

   -2.9709
    0.5491
    3.6000
    0.0509

A * x

ans =

   -1.0000
    6.0000
   -0.0000
    9.0000

