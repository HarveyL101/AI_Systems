x=-1:0.1:1;
y=x.^2;
z=x.^3;

xlabel('x');
ylabel('y');

legend('f(x)=x^2', 'g(x)=x^3');
title('Plots of f(x)=x^2 and g(x)=x^3 for x \in [-1,1]');

plot(x,y,'r--',x,z,'b--')