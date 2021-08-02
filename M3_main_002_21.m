function M3_main_002_21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This algorithm serves as the main function of Milestone 3. Its goal is 
% to preform parameter identification using a provided data set. It imports 
% a data set containing data on reactions between the PGOX50 enzyme and
% substrates From there, calculations are made to determine
% initial reaction velocities (v0), the maximum reaction velocity of the
% enzyme (Vmax), and the enzyme concentration at half of the maximum 
% reaction velocity (Km). The original product over time data is plotted, 
% along with a tangent representing the initial reaction velocity. Finally,
% the michaelis-menten model is plotted, along with the estimated v0 data.
%
% Function Call
% M2_algorithm_002_21
%
% Assignment Information
%   Assignment:     M3, problem 3
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

%The provided test data showing the product concentrations over time on
%multiple PGOX50 enzyme concentrations
PGOX50_Data = readmatrix('Data_PGOX50_enzyme');

%the enzyme concentrations the tests are being done at (uM)
concentrations = testData(6, 2:11);

%% ____________________
%% CALCULATIONS

%Formats the data on the PGOX50 enzyme data
PGOX50_Data = formatPGOX50(PGOX50_Data);

%estimates the initial reaction velocities at the tested concentrations
v0s = find_Vo(PGOX50_Data);
%Using the enzyme concentrations and corresponding v0s, the linear
%model of the Lineweaver-Burk plot is created
[slope, intercept] = LineweaverBurk(v0, concentrations);
%Using the Lineweaver-Burk model, Vmax and Km are calculated
[Vmax, Km] = Find_Vmax_Km(slope, intercept);


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
