function M4_main_002_21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This Function serves as the main for our Parameter Identification
% Project. This project aims preform parameter identification for various 
% enzymes specified by our client, Natural Catalysts. We are given data on
% Product concentrations relative to Time at various enzyme concentrations
% for each enzyme we are given. Using this data, an algorithm finds the 
% inital reaction velocity (v0 - uM/s), maximum initial reaction velocity 
% (Vmax - uM/s) and Enzyme Concenctration at half of Vmax (Km - uM) for
% each enzyme.
%
% Function Call
% M4_main_002_21
%
% Assignment Information
%   Assignment:     M4, problem 4
%   Team member:    Will (James) Stonebridge jwstoneb@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: griffin hentzen Ghentzen@purdue.edu
%                           Christopher Panagis cpanagis@purdue.edu
%                           trevor Matinova tmatinova@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

%Reads the KE data set into a matrix
KE_data = readmatrix('Data_nextGen_KEtesting_allresults');

%The number of enzymes in the KE data set
KE_enzyme_count = 5; 

%reads the data on the PGOX50 enzyme into a matrix
PGOX50_data = readmatrix('Data_PGOX50_enzyme');

%Initializes the enzyme concentrations at which the provided tests are
%preformed (uM)
concentrations = KE_data(1, 2:11);

%% ____________________
%% CALCULATIONS

%Formats the KE data set into a 3D matrix, with each sheet representing an
%individual enzyme's data
KE_sets = formatData(KE_data, KE_enzyme_count);

%Formats the PGOX50 data such that only the Product concentrations remain
%(uM)
PGOX50_set = formatPGOX50(PGOX50_data);

%This Algorithm preforms parameter analysis on all of the enzymes in KE and
%the PGOX50 enzyme. It outputs the v0s, Vmax and Km of every enzyme in both
%the PGOX50 and KE data. See the M4_algorithm_002_21 program description
%for in-depth details.
 M4_algorithm_002_21(KE_sets, KE_enzyme_count, PGOX50_set, concentrations);

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


