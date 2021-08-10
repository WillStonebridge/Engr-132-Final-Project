function M4_algorithm_002_21(KE_sets, KE_enzyme_count, PGOX50_set, ...
    concentrations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This Algorithm preforms parameter analysis on all of the enzymes in KE 
% and the PGOX50 enzyme. By estimating the intial slope of the
% provided tests and utilizing the Lineweaver-Burk method, this algorithm
% outputs the v0s, Vmax and Km of every enzyme in both the PGOX50 and KE
% data.
%
% Function Call 
% M4_algorithm_002_21(KE_sets, KE_enzyme_count, PGOX50_set, concentrations)
%
% Input Arguments
% KE_sets - the KE data set formatted in a 3D matrix, with each sheet 
% representing an enzyme
% KE_enzyme_count - The number of enzymes contained in the KE Data set
% PGOX50_set - the PGOX50 Product concentrations for every test (uM)
% concentrations - Initializes the enzyme concentrations at which the 
% provided tests are preformed (uM)
%
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
%% CALCULATIONS

%Iterates through the KE sets for each individual enzyme
for enzyme = 1:KE_enzyme_count
    %estimates the initial reaction velocities at the tested concentrations
    KE_v0s(enzyme, :) = find_Vo(KE_sets(:, :, enzyme));
    %Using the enzyme concentrations and corresponding v0s, the linear
    %model of the Lineweaver-Burk plot is created
    [slope, intercept] = LineweaverBurk(KE_v0s(enzyme, :), concentrations);
    %Using the Lineweaver-Burk model, Vmax and Km are calculated
    [KE_Vmaxs(enzyme), KE_Kms(enzyme)] = Find_Vmax_Km(slope, intercept);
end

%Estimates the initial reaction velocities of each enzyme/substrate test
%in the PGOX50 set (uM/sec)
PGOX50_v0s = find_Vo(PGOX50_set);

%Finds the slope and intercept of the Lineweaver Burk model corresponding
%to the aformentioned v0s
[slope, intercept] = LineweaverBurk(PGOX50_v0s, concentrations);

%Calculates the michaelis menten coefficients of the PGOX50 enzyme 
[PGOX50_Vmax, PGOX50_Km] = Find_Vmax_Km(slope, intercept);

%Condenses the v0s, Vmaxs, and Kms of the KE enzymes and the PGOX50 enzyme
%into single data sets for readability and ease of use.
v0s = [KE_v0s ; PGOX50_v0s];
Vmaxs = [KE_Vmaxs, PGOX50_Vmax];
Kms = [KE_Kms, PGOX50_Km];

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%Plots the Michaelis Menten Graphs for every Enzyme and then displays 
%the corresponding equation
Construct_mm(v0s, Vmaxs, Kms, KE_enzyme_count, concentrations);

%% ____________________
%% RESULTS

% Data on KE Enzyme A:
% Vmax: 1.07 | Km: 173.12 | SSE: 0.0156
% v0 values: 0.023 0.046 0.085 0.165 0.286 0.426 0.593 0.733 0.850 0.906 
% 
% Data on KE Enzyme B:
% Vmax: 0.93 | Km: 367.20 | SSE: 0.0022
% v0 values: 0.009 0.019 0.037 0.069 0.135 0.223 0.365 0.513 0.702 0.753 
% 
% Data on KE Enzyme C:
% Vmax: 1.23 | Km: 188.48 | SSE: 0.0014
% v0 values: 0.024 0.047 0.088 0.174 0.320 0.498 0.727 0.871 1.039 1.130 
% 
% Data on KE Enzyme D:
% Vmax: 1.60 | Km: 292.18 | SSE: 0.0035
% v0 values: 0.020 0.039 0.076 0.154 0.296 0.481 0.752 1.031 1.276 1.421 
% 
% Data on KE Enzyme E:
% Vmax: 1.62 | Km: 163.41 | SSE: 0.0099
% v0 values: 0.036 0.070 0.144 0.233 0.457 0.715 1.002 1.258 1.445 1.576 
% 
% Data on PGOX50 Enzyme:
% Vmax: 1.70 | Km: 239.26 | SSE: 0.0121
% v0 values: 0.026 0.050 0.107 0.185 0.334 0.597 0.927 1.196 1.306 1.550 

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
end