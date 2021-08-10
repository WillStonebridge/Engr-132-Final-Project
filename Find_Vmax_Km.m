function [Vmax,Km] = Find_Vmax_Km(m, b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%this function accepts an input of the values of m and b and then outputs
%the values of Vmax and Km
%
% Function Call
% find_Vmax_Km()
%
% Input Arguments
% m - slope of the lineweaver burk model
% b - the y intercept of the lineweaver burk model
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
yint = b; %This is the y intercept of the general equations found using y = mx+b
%% ____________________
%% CALCULATIONS
Vmax = 1/yint; %calculation for the value of Vmax
Km = m * Vmax; %calculations for the values of Km
end


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




