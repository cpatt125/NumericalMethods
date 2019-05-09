%% Simpson's Algorithm
% This function evaluates the integral of the array x with respect to y
%   x - the x values to integrate over
%   y - the f(x) values to integrate over
%Outputs:
%   I - the value of the integral of x with respect to y

function [I] = Simpson(x,y)

%Compares the lengths of the x and y arrays.  Throws an error if the arrays
%are not the same length.

%Creates a linear spaced array from the first value to the last in the
%array x.  Compares the created array to the user input.  Throws an error
%if they are not identical indicating the spacing is not equal throughout.

%Tests for a remainder in the number of intervals.  A remainder indicates
%there is an odd number of intervals and the trapezoidal rule must be used
%in the last.

a = length(x);
b = length(y);

if a ~= b
    error('Arrays for x and y values must be the same length.')
else
end 

if 0 == isequal(x,linspace(x(1,1),x(1,a),a))
    error('The values in array x are not equally spaced.')
else
end

if rem((length(x)-1)/2,1) ~= 0
    warning('The trapezoidal rule must be used on the last interval. Array contains odd number of intervals.')
else
end

%If statement used to determine when Simpson's 1/3 rule will be
%used alone while the remainder is 0.  Else Simpson's rule will be
%used on the even intervals until the last interval where the trapezoidal rule will
%be used.

if rem((length(x)-1)/2,1) == 0
    h = x(1,2)-x(1,1);
    I = 1:((a-1)/2);
    interval_count = 1;
    x_interval = 1;
    while x(1,x_interval) ~= x(1,a)
        I(1,interval_count) = 2*h*((y(1,x_interval)+4*y(1,x_interval+1)+y(1,x_interval+2))/6);
        x_interval = x_interval+2;
        interval_count = interval_count+1;
    end
    I = sum(I);
else 
    h = x(1,2)-x(1,1);
    I = 1:((a/2)-1);
    interval_count = 1;
    x_interval = 1;
    while x(1,x_interval) ~= x(1,a-1)
        I(1,interval_count) = 2*h*((y(1,x_interval)+4*y(1,x_interval+1)+y(1,x_interval+2))/6);
        x_interval = x_interval+2;
        interval_count = interval_count+1;
    end
    trap_rule = (x(1,a)-x(1,a-1))*((y(1,a)+y(1,a-1))/2);
    I = sum(I)+trap_rule;
end
end