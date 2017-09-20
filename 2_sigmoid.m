function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

t=size(z);
si=t(1);
ti=t(2);

    
        for i=1:si
            for j=1:ti

                g(i,j)=(1+e^-z(i,j))^-1;
            end
        end





% =============================================================

end
