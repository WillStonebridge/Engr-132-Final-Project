function M3_MM_PGOX50_002_21
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program takes in the csv file with the data for the PGOX50 data set
% as well as including the provided values from the M3 answer sheet that
% are the Vo, Vmax and Km values. This program will use the data set to
% create 10 plots containing the concentration curves with the Vo tangent
% line. A figure will also be made that is the Michaelis Menten curve of
% the provided data. Once all of these are found the SSE will be calculated
% to determine the accuracy of the found values to the ones calculated by
% the Michaelis Menten equation.
%
% Function Call
% M3_MM_PGOX50_002_21
%
% Input Arguments
% NA
%
% Output Arguments
% NA
%
% Assignment Information
%   Assignment:     M03, Problem #2A
%   Team member:    Christopher , cpanagis@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%code for Michaelis Menten curve
sub = [3.75 7.5 15 30 65 125 250 500 1000 2000];
Vo = [.025 .049 .099 .176 .329 .563 .874 1.192 1.361 1.603];
Vmax = 1.806;
Km = 269.74;

%code for concentration curves with tangent line
data = readmatrix('Data_PGOX50_enzyme.csv'); %inputs the data into the function

time = data(:,1); %determines the time of each test.

%Sets specific product concentration for each test.
Test1_conc = data(:,2);
Test2_conc = data(:,3);
Test3_conc = data(:,4);
Test4_conc = data(:,5);
Test5_conc = data(:,6);
Test6_conc = data(:,7);
Test7_conc = data(:,8);
Test8_conc = data(:,9);
Test9_conc = data(:,10);
Test10_conc = data(:,11);
TestConcArr = [Test1_conc';Test2_conc';Test3_conc';Test4_conc';Test5_conc';Test6_conc';Test7_conc';Test8_conc';Test9_conc';Test10_conc'];

%Sets the x value that the tangent line will reach
x_tang1 = [1:100,1:100,1:100,1:100,1:100,1:25]; 
x_tang2 = [1:102,1:102,1:102,1:102,1:102,1:15]; 
x_tang3 = [1:101,1:101,1:101,1:101,1:101,1:20]; 
x_tang4 = [1:125,1:125,1:125,1:125,1:25]; 
x_tang5 = [1:130,1:130,1:130,1:130,1:5]; 
x_tang6 = [1:145,1:145,1:145,1:90]; 
x_tang7 = [1:175,1:175,1:175]; 
x_tang8 = [1:195,1:195,1:135]; 
x_tang9 = [1:400,1:125]; 
x_tang10 = [1:525]; 
xTangArr = [x_tang1;x_tang2;x_tang3;x_tang4;x_tang5;x_tang6;x_tang7;x_tang8;x_tang9;x_tang10];

%code for finding the Vo values from the imported csv file
num_cols = 11; % the number of columns of data for each enzyme
conc_levels = 11; % the number of concentration levels for each enzyme test
start_length = 52; % the length of the starting dataset
time_data = [0:start_length-9]; % establishes the time dataset, of the same length as the starting data

%% ____________________
%% CALCULATIONS
%code for finding the Vo values from the imported csv file
for i =[1:num_cols]
    start_data = data(9:start_length,i);
    size(polyfit(time_data,start_data,1));
    coeffs = polyfit(time_data,start_data,1);
    start_vels(1,i) = coeffs(1); % initial velocity array (uM/sec)
end

%For Loop goes through initial velocity and averages them for different
%concentration levels.
for i = [1:conc_levels]
    Vo_Calc(i) = start_vels(i);
end


%code for Michaelis Menten curve
y_mm = (Vmax .* sub) ./ (Km + sub);
for z = 1:10
    SSEarr = ((Vo - y_mm).^2);
end
SSE = sum(SSEarr);


%code for concentration curves with tangent line
y_tang1 = Vo_Calc(2) .* x_tang1;
y_tang2 = Vo_Calc(3) .* x_tang2;
y_tang3 = Vo_Calc(4) .* x_tang3;
y_tang4 = Vo_Calc(5) .* x_tang4;
y_tang5 = Vo_Calc(6) .* x_tang5;
y_tang6 = Vo_Calc(7) .* x_tang6;
y_tang7 = Vo_Calc(8) .* x_tang7;
y_tang8 = Vo_Calc(9) .* x_tang8;
y_tang9 = Vo_Calc(10) .* x_tang9;
y_tang10 = Vo_Calc(11) .* x_tang10;
yTangArr = [y_tang1;y_tang2;y_tang3;y_tang4;y_tang5;y_tang6;y_tang7;y_tang8;y_tang9;y_tang10];
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%code for Michaelis Menten curve
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
fprintf("vmax: %.4f\nkm: %.4f\nSSE: %.4f", Vmax, Km, SSE);

counter = 1; %used to determine which plot is being currently worked on
counterDisp = 49; %counter value that has to reference the ASCII table to be properly displayed
for u = 1:5
    figure(u+1)
    for w = 1:2
         subplot(1,2,w)
         plot(time,TestConcArr(counter,:),'y.')
         hold on
         plot(xTangArr(counter,:),yTangArr(counter,:),'b-')
         xlabel('time(s)')
         ylabel('Product Concentration(uM)')
         if(counter == 10)
             title(['Test 10'], ['Substrate Concentration ',num2str(sub(counter)),' (uM)'])
         else
             title(['Test ',counterDisp,''], ['Substrate Concentration ',num2str(sub(counter)),' (uM)'])
         end
         grid on
         legend('Concentration curve','Tangent line','location','best')
         hold off
         counter = counter + 1;
         counterDisp = counterDisp + 1;
    end
end

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.


