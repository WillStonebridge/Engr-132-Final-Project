function M2_algorithm_002_21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This algorithm serves as the main function of this project. Its goal is 
% to preform parameter identification using a provided data set. It imports 
% a data set containing data on reactions between various enzymes and
% substrates. The data set is formatted such that each enzyme can be
% analyzed individually. From there calculations are made to determine
% initial reaction velocities (v0), the maximum reaction velocity of each
% enzyme (Vmax), and the enzyme concentration at half of the maximum 
% reaction velocity (Km). At this point in the project, the v0, Km and Vmax
% of each enzyme are displayed to the command window.
%
% Function Call
% M2_algorithm_002_21
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    Will Stonebrigde jwstoneb@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: griffin hentzen Ghentzen@purdue.edu
%                           Christopher Panagis cpanagis@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

%The provided test data showing the product concentrations over time on
%various enzymes concentrations
testData = readmatrix('Data_nextGen_KEtesting_allresults');

%The number of enzymes to be analyzed
enzymeCount = 5;

%the enzyme concentrations the tests are being done at (uM)
concentrations = testData(1, 2:11);

%% ____________________
%% CALCULATIONS

%Formats the data set into a 3D matrix, with each sheet representing an
%enzyme
enzymeSets = formatData(testData, enzymeCount);

%Iterates through the test data for each individual enzyme
for enzyme = 1:enzymeCount
    %estimates the initial reaction velocities at the tested concentrations
    v0s(enzyme, :) = find_Vo(enzymeSets(:, :, enzyme));
    %Using the enzyme concentrations and corresponding v0s, the linear
    %model of the Lineweaver-Burk plot is created
    [slope, intercept] = LineweaverBurk(v0s(enzyme, :), concentrations);
    %Using the Lineweaver-Burk model, Vmax and Km are calculated
    [Vmaxs(enzyme), Kms(enzyme)] = Find_Vmax_Km(slope, intercept);
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%Plots the Michaelis Menten Graphs and then displays the corresponding
%equation
Construct_mm(v0s, concentrations, Vmaxs, Kms, enzymeCount);

%% ____________________
%% RESULTS

% Data on Enzyme 1:
% Vmax: 0.99 | Km: 167.54
% v0 values: 0.02 0.04 0.08 0.16 0.27 0.42 0.58 0.72 0.84 0.89 
% 
% Data on Enzyme 2:
% Vmax: 0.87 | Km: 346.88
% v0 values: 0.01 0.02 0.04 0.07 0.13 0.23 0.36 0.51 0.70 0.74 
% 
% Data on Enzyme 3:
% Vmax: 1.31 | Km: 218.24
% v0 values: 0.02 0.04 0.08 0.16 0.30 0.47 0.69 0.87 1.04 1.12 
% 
% Data on Enzyme 4:
% Vmax: 1.54 | Km: 294.33
% v0 values: 0.02 0.04 0.07 0.14 0.28 0.47 0.73 1.01 1.26 1.42 
% 
% Data on Enzyme 5:
% Vmax: 1.64 | Km: 185.65
% v0 values: 0.03 0.06 0.12 0.22 0.43 0.66 0.97 1.22 1.45 1.56 

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
end