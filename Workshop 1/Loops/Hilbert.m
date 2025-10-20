% The n-by-n Hilbert matrix H, has as its entries Hi,j = 1/(i + j – 1), i,j = 1, 2, …, n. 
% Create a double “for loop” to generate the 5-by-5 Hilbert matrix and check your answer 
% using the built-in MATLAB command hilb. 

n=5;
H=zeros(5);

for i=1:n
    for j=1:n
        H(i,j) = 1/(i+j-1);
    end
end

disp('This is the Hilbert matrix calculated by my nested for loop');
disp(H);





