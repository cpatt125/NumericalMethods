%% False Position 
%By: Cary Patterson
% This function finds a root estimate for the inputed function.
% It will output the root estimate, the corresponding output of the
% function, the approximate error, and the number of iterations it took.
% Input Variables:
%   func = the function being evaluated
%       -function variable must be inputed as "x"
%   lb = the lower guess of the bracketed area
%   ub = the upper guess of the bracketed area
%   Es = the stopping criterion as maximum percent error
%   maxiter = the maxiumum number of iterations to be done before ending
% Output Variables:
%   root = the root estimate within the given bounds
%   fx = the corresponding output value for the root estimate
%   Ea = the approximate relative error
%   iter = the number of iterations completed before ending 

clear all
clc all

function [root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter);

countiter = 1;                              %countiter starts a count for the iterations
count_array = [1:maxiter];                  %count_array will store the roots for every iteration until it reaches the maximum
ec = 100;                                   %starting error is 100 to start to the loop but will be changed once the loops starts

while ec >= es && countiter < maxiter       %starting a while loop that will end when the error is smaller than the inputed or when the number of iterations has exceeded to the max
    if xl*xu > 0                            %checking if the bracket guesses have the same sign 
        error('No root in given bracket')   %error message if the signs are the same for the bracket guesses
    else
        guess_bracket = [xl xu]             %an array that stores the bracket guesses 
        x = guess_bracket;                  %making x equal to the bracket guesses so they may be plugged into the equation 
        rx = xu-((func(2).*(xl-xu))./(func(1)-func(2)));    %finding the rx value between the two guess values
        x = rx                              %making x equal to the rx value so it may be plugged into the equation
        frx = func                          %setting the function value equal to f(rx)
        if frx*xl < 0                       %testing if the f(rx) value times the lower guess is less than zero
            xu = rx                         %if true the rx value is the new upper guess
        else 
            xl = rx                         %if not true the rx value is the new lower guess
        end
    end
    countiter = countiter + 1;              %adds a count to the iteration every time the loop is completed
    count_array(countiter) = rx             %adds the rx value to the count_array
    count_array(1) = 0;                     %makes the first value in the array zero because there is no previous error
    ec = abs(((rx-count_array(countiter-1))/rx)*100);   %calculates the approximate percent relative error
end

format long

root = rx
fx = frx
ea = ec
iter = countiter - 1


fprintf('\n The root estimate for the function is %e \n',root);
fprintf('\n The function''s output for the root is %e \n',fx);
fprintf('\n The approximate error of the root is %e \n',ea);
fprintf('\n The total number of iterations completed is %d \n',iter);

end

    
    
    
    
    
    
    
    