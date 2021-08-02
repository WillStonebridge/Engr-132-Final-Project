function formattedPGOX50 = formatPGOX50(PGOX50)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This Function formats the PGOX50 data
%
% Function Call
% function updatedSets = addPGOX50(enzymeSets, enzymeCount, newEnzyme)
%
% Input Arguments
% PGOX50 - A Data set containing product concentration data over time
% for the reaction between the PGOX50 enzyme and a substrate.
%
% Output Arguments
% formattedPGOX50 - a formatted version of the PGOX50 data
%
% Assignment Information
%   Assignment:     M3, Problem 3
%   Team member:    Will (James) Stonebridge, jwstoneb@purdue.edu 
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% CALCULATIONS

%Finds the size of the enzyme matrix and then crops it such
%that only the product concentration data remains
newSize = size(PGOX50);
PGOX50 = PGOX50(5:newSize(1), 2:newSize(2));

%Duplicates the matrix in order to make it fit with the other enzymes,
%which contain two sets of tests
formattedPGOX50 = [PGOX50, PGOX50];

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



