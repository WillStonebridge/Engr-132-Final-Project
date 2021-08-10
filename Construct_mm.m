function Construct_mm(v0s, Vmaxs, Kms, KE_enzyme_count, concentrations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This UDF is responsible for the creation of each enzymes Michaelis Menten
% plot. Additionally, It professionally displays the v0s, Vmaxs, Kms and
% SSEs of each individual enzyme to the command window.
%
% Function Call
% Construct_mm(v0s, Vmaxs, Kms, KE_enzyme_count, concentrations)
%
% Input Arguments
% v0s - An array that will display the 10 intitial velocities of each
% enzyme. Will be displayed as a (# of Enzymes)*10 array. (uM/s)
% Vmaxs - A vector for the Vmax values of each enzyme. (uM/s)
% Kms - A vector for the Km values for each enzyme. (uM)
% KE_enzyme_count: The number of enzymes in the KE data set. 
% concentrations - A vector containing the 10 concentrations for each
% enzyme. (uM)
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    Will Stonebridge jwstoneb@purdue.edu
%                   Christopher Panagis cpanagis@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Trevor Matovina, tmatovin@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

%A String array containing the name of every enzyme
Enzyme_Names = ["A", "B", "C", "D", "E", "PGOX50"];

%% ____________________
%% CALCULATIONS

%Calculates the total number of enzymes to be analyzed. This also serves as
%the index of the PGOX50 data.
enzyme_count = KE_enzyme_count + 1;

%Calculates model v0 values using the Michaelis Menten Equation (uM/s)
for enzyme = 1:enzyme_count
    v0s_mm(enzyme,:) = (Vmaxs(1,enzyme) .* concentrations) ./ ...
        (Kms(1,enzyme) + concentrations);
end

%Calculates the SSE of each model
for enzyme = 1:enzyme_count
    SSEs(enzyme) = sum((v0s(enzyme, :) - v0s_mm(enzyme, :)).^2);
end

%iterates through each enzyme
for enzyme = 1:enzyme_count
    %Titles the enzyme
    if enzyme <= KE_enzyme_count
        fprintf("Data on KE Enzyme " + Enzyme_Names(enzyme) + ":\n", ...
            enzyme);
    else
        fprintf("Data on PGOX50 Enzyme:\n"); 
    end 
    %Displays the Vmax and Km values
    fprintf("Vmax: %.2f | Km: %.2f | SSE: %.4f\n", Vmaxs(enzyme), ...
        Kms(enzyme), SSEs(enzyme));
    fprintf("v0 values: ");
    %iterates through and displays each reaction velocity
    for velocity = v0s(enzyme, :)
        fprintf('%.3f ', velocity);
    end
    fprintf('\n\n');
end


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%Iterates through each enzyme as it plots the michaelis menten graphs
for enzyme = 1:enzyme_count
    
    %Plots and formats the v0s and model v0s to create a Michaelis Menten
    %subplot
    subplot(2,3, enzyme);
    plot(concentrations, v0s(enzyme,:), 'r*')
    hold on
    plot(concentrations, v0s_mm(enzyme,:), '-b')
    xlabel('Substrate Concentration (uM)');
    ylabel('Initial Velocity (uM/s)');
    legend("Initial Velocity data points", 'Michaelis Menten Curve', ...
        'location', 'southeast');
    grid on
    
    %Constructs and then assigns the Title of the given Plot
    Plot_Title = strcat("Michaelis Menten curve of Enzyme ", ...
        Enzyme_Names(enzyme));
    title(Plot_Title);
end

%Titles the figure
sgtitle("Michaelis Menten Plots for 6 Different Enzymes");
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



