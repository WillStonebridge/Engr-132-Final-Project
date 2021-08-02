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

%Sets the x value that the tangent line will reach
x_tang1 = [1:100]; 
x_tang2 = [1:102]; 
x_tang3 = [1:101]; 
x_tang4 = [1:125]; 
x_tang5 = [1:130]; 
x_tang6 = [1:145]; 
x_tang7 = [1:175]; 
x_tang8 = [1:195]; 
x_tang9 = [1:400]; 
x_tang10 = [1:525]; 

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

%code for concentration curves with tangent lines
figure(2)

subplot(1,2,1)
plot(time,Test1_conc,'y.')
hold on
plot(x_tang1,y_tang1,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 1', 'Substrate Concentration 3.75 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test2_conc,'y.')
hold on
plot(x_tang2,y_tang2,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 2', 'Substrate Concentration 7.5 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(3)

subplot(1,2,1)
plot(time,Test3_conc,'y.')
hold on
plot(x_tang3,y_tang3,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 3' , 'Substrate Concentration 15 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test4_conc,'y.')
hold on
plot(x_tang4,y_tang4,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 4','Substrate Concentration 30 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(4)

subplot(1,2,1)
plot(time,Test5_conc,'y.')
hold on
plot(x_tang5,y_tang5,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 5','Substrate Concentration 65 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off


subplot(1,2,2)
plot(time,Test6_conc,'y.')
hold on
plot(x_tang6,y_tang6,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 6','Substrate Concentration 125 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(5)

subplot(1,2,1)
plot(time,Test7_conc,'y.')
hold on
plot(x_tang7,y_tang7,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 7','Substrate Concentration 250 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test8_conc,'y.')
hold on
plot(x_tang8,y_tang8,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 8','Substrate Concentration 500 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

figure(6)

subplot(1,2,1)
plot(time,Test9_conc,'y.')
hold on
plot(x_tang9,y_tang9,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 9','Substrate Concentration 1000 (uM)')
grid on
legend('Concentration curve','Tangent line','location','best')
hold off

subplot(1,2,2)
plot(time,Test10_conc,'y.')
hold on
plot(x_tang10,y_tang10,'b-')
xlabel('time(s)')
ylabel('Product Concentration(uM)')
title('Test 10','Substrate Concentration 2000 (uM)')
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



