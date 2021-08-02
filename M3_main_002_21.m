%function M3_main_002_21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This algorithm serves as the main function of Milestone 3. Its goal is 
% to preform parameter identification using a provided data set. It imports 
% a data set containing data on reactions between the PGOX50 enzyme and
% substrates From there, calculations are made to determine
% initial reaction velocities (v0), the maximum reaction velocity of the
% enzyme (Vmax), and the enzyme concentration at half of the maximum 
% reaction velocity (Km), along with an SSE from the provided v0 data.
% Finally, the michaelis menten plot, and original data (with v0 tangents)
% is plotted  .
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
concentrations = PGOX50_Data(2, 2:11);

%The provided v0s for the michaelis menten curve
reference_v0s = [.025 .049 .099 .176 .329 .563 .874 1.192 1.361 1.603];

%% ____________________
%% CALCULATIONS

%Runs the algorithm coded in milestone 2. This finds the v0s to be used in
%the michaelis menten model, along with the Vmax and Km values. It also
%provides a model for the michaelis menten plot
[v0s, Vmax, Km, model] = M3_Algorithm_002_21(PGOX50_Data);

%Calculates the SSE for the michaelis menten model using the previously
%calculated v0 data points
SSE = sum((v0s - model).^2);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%Plots the Original Product data along with v0 tangent lines
plot_v0s(v0s, PGOX50_Data, concentrations);

%Plots and formats the Michaelis menten plot
figure(2)
plot(concentrations, model, '-b');
hold on;
grid on;
plot(concentrations, v0s, 'bd');
title('Michaelis Menten curve of Enzyme');
xlabel('Substrate Concentration (uM)');
ylabel('Initial Velocity (uM/s)');
legend('Michaelis Menten Curve', "Initial Velocity data points", ...
    'location', 'best');


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



