function Construct_mm(v0,enzyme_conc,Vmax,Km,enzyme_count)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This program will display the values in order to find the michaeles menten
%equation, which will later be used to find a smooth concentration curve.
%
% Function Call
% Construct_mm(v0,enzyme_conc,Vmax,Km)
%
% Input Arguments
% V0: An array that will display the 10 intitial velocities of each enzyme,
% will be displayed as a 5*10 array. 
% Vmax: A vector for the 5 Vmax values of each enzyme.
% Km: A vector for the 5 Km values for each enzyme
% Enzyme_conc: A vector containing the 10 concentrations for each enzyme. 
% Enzyme_count: How many ezymes there are being tested.
% Output Arguments
% none
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    Will Stonebridge jwstoneb@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Trevor Matovina, tmatovin@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION


%% ____________________
%% CALCULATIONS

%iterates through each enzyme
for enzyme = 1:enzyme_count
    %Titles the enzyme
    fprintf("Data on Enzyme %d:\n", enzyme);
    %Displays the Vmax and Km values
    fprintf("Vmax: %.2f | Km: %.2f\n", Vmax(enzyme), Km(enzyme));
    fprintf("v0 values: ");
    %iterates through and displays each reaction velocity
    for velocity = v0(enzyme, :)
        fprintf('%.2f ', velocity);
    end
    fprintf('\n\n');
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



