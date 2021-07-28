function [slope, intercept] = LineweaverBurk(v0s, concentrations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% this function accepts an input of initial reaction velocities and
% corresponding enzyme concentrations. Using these inputs, the data is
% linearized using the Lineweaver-Burk Process. Finally the linear model is
% calculated and its slope and intercept are returned
%
% Function Call
% [slope, intercept] = LineweaverBurk(v0s, concentrations)
%
% Input Arguments
% v0s - inital reaction velocities between a substrate and enzyme (uM/s)
% concentrations - the enzyme concentrations corresponding to the initial
% reaction velocities (uM)
%
% Output Arguments
% slope - slope of the lineweaver burk model
% intercept - the y intercept of the lineweaver burk model
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    Will Stonebrigde jwstoneb@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% CALCULATIONS

%formats the data set for the lineweaver Burk plot. In order to create the
%plot, the reciprocal of the v0s must be used as the y set and the
%reciprocal of the concentrations must be used as the x set.
v0s_Reciprocal = 1 ./ v0s;
concentrations_Reciprocal = 1 ./ concentrations;

%Uses linear regression to find the slope of the lineweaver-burk model
slope = (mean(concentrations_Reciprocal) * mean(v0s_Reciprocal) - ...
    mean(concentrations_Reciprocal .* v0s_Reciprocal));
slope = slope / (mean(concentrations_Reciprocal)^2 - ...
    mean(concentrations_Reciprocal.^2));

%Uses linear regression to find the intercept of the lineweaver-burk model
intercept = mean(v0s_Reciprocal) - slope * mean(concentrations_Reciprocal);

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
