function M3_MM_PGOX50_SSS_tt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This program will display a figure to display the ten concentration
%curves from the data given, as well as the intitial velocity tangent
%lines. It will then use Vmax and Km in the michaelis menten equation to
%plot a model representing the initial velocities as a function of
%substrate concentration. From this model, it will then estimate the sum of
%squared errors. 
%
% Function Call
%M3_MM_PGOX50_SSS_tt
%
% Input Arguments
replace this text with a commented list of the input arguments
%
% Output Arguments
replace this text with a commented list of the output arguments
%
% Assignment Information
%   Assignment:     M3, Problem 2
%   Team member:    Trevor Matovina, tmatovin@purdue.edu [repeat for each person]
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
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

v0_PGO = [0.025, 0.049, 0.099, 0.176, 0.329, 0.563, 0.874, 1.192, 1.361, 1.603]; 

x_tang = [1:150]; 
    

%% ____________________
%% CALCULATIONS
y_tang1 = v0_PGO(1) .* x_tang;
y_tang2 = v0_PGO(2) .* x_tang;
y_tang3 = v0_PGO(3) .* x_tang;
y_tang4 = v0_PGO(4) .* x_tang;
y_tang5 = v0_PGO(5) .* x_tang;
y_tang6 = v0_PGO(6) .* x_tang;
y_tang7 = v0_PGO(7) .* x_tang;
y_tang8 = v0_PGO(8) .* x_tang;
y_tang9 = v0_PGO(9) .* x_tang;
y_tang10 = v0_PGO(10) .* x_tang;

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(1)

subplot(1,2,1)
plot(time,Test1_conc,'y.')
hold on
plot(x_tang,y_tang1,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 1 @ Substrate Concentration 3.75 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test2_conc,'y.')
hold on
plot(x_tang,y_tang2,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 2 @ Substrate Concentration 7.5 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(2)

subplot(1,2,1)
plot(time,Test3_conc,'y.')
hold on
plot(x_tang,y_tang3,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 3 @ Substrate Concentration 15 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test4_conc,'y.')
hold on
plot(x_tang,y_tang4,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 4 @ Substrate Concentration 30 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(3)

subplot(1,2,1)
plot(time,Test5_conc,'y.')
hold on
plot(x_tang,y_tang5,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 5 @ Substrate Concentration 65 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off


subplot(1,2,2)
plot(time,Test6_conc,'y.')
hold on
plot(x_tang,y_tang6,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 6 @ Substrate Concentration 125 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(4)

subplot(1,2,1)
plot(time,Test7_conc,'y.')
hold on
plot(x_tang,y_tang7,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 7 @ Substrate Concentration 250 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test8_conc,'y.')
hold on
plot(x_tang,y_tang8,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 8 @ Substrate Concentration 500 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(5)

subplot(1,2,1)
plot(time,Test9_conc,'y.')
hold on
plot(x_tang,y_tang9,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 9 @ Substrate Concentration 1000 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test10_conc,'y.')
hold on
plot(x_tang,y_tang10,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 10 @ Substrate Concentration 2000 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



