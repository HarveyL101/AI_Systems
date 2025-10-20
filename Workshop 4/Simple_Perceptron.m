function [w, b] = Simple_Perceptron(x, t, w, b)

% x = [1; -3];
% t = [1];
% w = [.3 0.7];
% b = [-0.8];

% x = input
% t = target
% w = weighting
% b = Bias

y = threshold_act([w b] * [x ;1]);

if y==t         % Correct output, no change w=w; b=b;

elseif y==0     % Target=1
    w = w + x';
    b = b + 1;

else            % y=1 target=0
    w = w - x';
    b = b - 1

end