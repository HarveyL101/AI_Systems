x=-pi:0.01:pi;
y=cos(x); 

plot(x,y)

xlabel('x')
ylabel('y=cos(x)')

% A fully labelled graph of cosine from -pi to pi)
title('Graph of cosine from - \pi to \pi')
plot(x,y)

% the graph but in green
plot(x, y, 'g')

% using a dashed line instead, good for distinguishing between values
plot(x,y,'--')

% these can be combined, hence 'blue dotted line'
plot(x,y,'b:')

% multiple curves can appear on the same graph (xy = red and dashed, xz = blue and dotted) 
z = sin(x);
plot(x,y, 'r--',x,z,'b:')

legend('cos(x)', 'sin(x)')