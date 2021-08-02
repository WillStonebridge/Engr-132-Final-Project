function [Vmax,Km] = Find_Vmax_Km(vo, sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%this function accepts an input of the values of the arrays of vo and sub and then outputs
%the values of Vmax and Km
%
% Function Call
% find_Vmax_Km()
%
% Input Arguments
% vo - array of vo values for substrate
% sub - list of substrate concentrations
%
% Output Arguments
% Vmax - The maximum initial reaction velocity (uM/s)
% Km - The concentration at half Vmax (uM)
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    Christopher Panagis cpanagis@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

%% ____________________
%% CALCULATIONS
y = 1 ./ vo; %y value that is equal to the reciprical of the v nought value found by the function
x = 1 ./ sub; %x value that is equal to the reciprical of the substrate concentration

coef = polyfit(x, y, 1);
m = coef(1); %m constant in a linear equation
b = coef(2); %b constant in a linear equation
km = m / b; %km value
vmax = 1 / b; %vmax value found by taking the reciprical of the b value


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.




