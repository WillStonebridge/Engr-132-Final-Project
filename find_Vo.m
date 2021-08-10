function [avg_Vo] = find_Vo(catalyst_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%this function accepts an input of 20 tests for a catalyst, and find the
%average Vo for each concentration and outputs those 10 vaues as a vector
%
% Function Call
% find_Vo()
%
% Input Arguments
% catalyst_data - the data for a single enzymes data taken from the data
% set. (various units)
%
% Output Arguments
% avg_Vo - the average initial velocities for each concentration (uM/sec)
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    griffin hentzen Ghentzen@purdue.edu
%                   Trevor Matovina Tmatovin@purdue.edu
%                   Will Stonebridge jwstoneb@purdue.edu
%                   Chris Panagis cpanagis@purdue.edu 
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
num_cols = 20; % the number of columns of data for each enzyme
conc_levels = 10; % the number of concentration levels for each enzyme test
%EDIT start_length = 52; % the length of the starting dataset
start_length = 33;  %changed value for th evalue of Vo                
time_data = [0:start_length-3]; % establishes the time dataset, of the same length as the starting data

%% ____________________
%% CALCULATIONS
%For Loop goes through each column and finds the inititla velocity given
%the first 50 data points.
for i =[1:num_cols]
    start_data = catalyst_data(3:start_length,i);
    size(polyfit(time_data,start_data,1));
    coeffs = polyfit(time_data,start_data,1);
    start_vels(1,i) = coeffs(1); % initial velocity array (uM/sec)
end

%For Loop goes through initial velocity and averages them for different
%concentration levels.
for i = [1:conc_levels]
    avg_Vo(i) = (start_vels(i)+start_vels(i+10))/2;
end

%necessary code in the main function to call my values properly:
%(ANYTHING IN ALL CAPS SHOULD BE RENAMED TO MATCH THE REST OF THE MAIN
% FUNCTION)
%ALL_DATA = readmatrix('Data_nextGen_KEtesting_allresults.csv');
%for i =[0:4]
%    ENZYME_DATA = ALL_DATA(:,(2+20*i):(1+20*(i+1)));
%    VARIABLE_WITH_SOME_INDICES = find_Vo(ENZYME_DATA);
%end

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



