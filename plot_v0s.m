function plot_v0s(v0s, PGOX50, concentrations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% this function accepts an input of initial reaction velocities, test data
% between substrates and the PGOX50 enzyme and corresponding enzyme 
% concentrations. Using these inputs, the data is plotted along with a
% tangent representing the initial reaction velocity for a given test.
%
% Function Call
% plot_v0s(v0s, PGOX50_Data, concentrations)
%
% Input Arguments
% v0s - inital reaction velocities between a substrate and enzyme (uM/s)
% concentrations - the enzyme concentrations corresponding to the initial
% reaction velocities (uM)
% PGOX50 - A Data set containing product concentration data over time
% for the reaction between the PGOX50 enzyme and a substrate
%
%
% Assignment Information
%   Assignment:     M3, Problem 3
%   Team member:    Will Stonebrigde jwstoneb@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

%The number of tests provided by the PGOX50 data set
testCount = 10;

%% ____________________
%% CALCULATIONS

%Finds the size of the data set for formatting purposes
PGOX50_Size = size(PGOX50);

%Finds the times at which measurements of the product concentration are
%done (sec)
time = PGOX50(5:PGOX50_Size(1), 1);

%Isolates the data such that only the product concentration values remain
%(uM)
PGOX50 = PGOX50(5:PGOX50_Size(1), 2:PGOX50_Size(2));



%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

figure(1);

for test = 1:testCount
    
    %Names the subplot appropriately
    testTitle = "PGOX50 Concentration " + concentrations(test) ...
        + " (uM)";
    
    %Creates a shorter time array for use with the v0 tangents
    timeTangent = time(1:size(time)/ (4 - concentrations(test) / 1000));
    
    %Creates the v0 tangent line that will be used on the plot
    tangent = polyval([v0s(test), 0], timeTangent);
    
    %Plots and formats the subplot
    subplot(3, 4, test);
    plot(time, PGOX50(:, test), 'b.');
    grid on
    hold on
    plot(timeTangent, tangent, 'r-');
    title(testTitle);
    xlabel('time(s)')
    ylabel('Product Concentration(uM)')
    legend('Product','v0 Tangent','location','southeast')
end

sgtitle('Product Concentrations over Time during a PGOX50 Enzyme Reaction');

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
