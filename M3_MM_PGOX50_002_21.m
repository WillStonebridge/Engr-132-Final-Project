%replace this text with your function definition line
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%replace this text with your program description as a comment
%
% Function Call
%replace this text with a comment that states the function call
%
% Input Arguments
%replace this text with a commented list of the input arguments
%
% Output Arguments
%replace this text with a commented list of the output arguments
%
% Assignment Information
%   Assignment:     M##, Problem #
%   Team member:    Name, login@purdue.edu [repeat for each person]
%   Team ID:        ###-##
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
sub = [3.75 7.5 15 30 65 125 250 500 1000 2000];
Vo = [.025 .049 .099 .176 .329 .563 .874 1.192 1.361 1.603];
Vmax = 1.806;
Km = 269.74;
%% ____________________
%% CALCULATIONS
y_mm = (Vmax .* sub) ./ (Km + sub);
for z = 1:10
    SSEarr = ((Vo - y_mm).^2);
end
SSE = sum(SSEarr);
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(1)
plot(sub, Vo, 'b*')
hold on
plot(sub, y_mm)
title('Michaelis Menten curve of Enzyme')
xlabel('Substrate Concentration (uM)')
ylabel('Initial Velocity')
legend("Initial Velocity data points", 'Michaelis Menten Curve')
grid on
hold off
fprintf("vmax: %f\nkm: %f\n", Vmax, Km);
disp(SSE);
%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



