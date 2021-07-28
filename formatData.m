function enzymeSets = formatData(testData, enzymeCount)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function takes the number of enzymes tested and the provided data
% set and outputs a 3 Dimensional array which seperates each enzyme on to
% its own 'sheet'
%
% Function Call
% enzymeSets = formatData(testData, enzymeCount)
%
% Input Arguments
% testData - The provided test data showing the product concentrations over
% time on various enzymes and concentrations
% enzymeCount - The number of enzymes contained in the data set
%
% Output Arguments
% enzymeSets - a 3 Dimensional array. Each depth index contains a matrix of
% tests preformed on a specific enzyme. (For example enzymeSets(:, :, 2)
% is a matrix of every test done on enzyme B)
%
% Assignment Information
%   Assignment:     M2, Problem 1
%   Team member:    Will Stonebrigde jwstoneb@purdue.edu
%   Team ID:        002-21
%   Academic Integrity:
%     [X] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% CALCULATIONS

%Gets the Dimensions of the data set
testDataDimensions = size(testData);

%Finds the number of tests done on each enzyme
testCount = (testDataDimensions(2) - 1) / enzymeCount;

%Removes the unit blocks from the dataset. From now on, the first row will 
%be enzyme concentrations and the rows below will be corresponding product
%concentrations
testData = [testData(1, :); testData(3:testDataDimensions(1), :)];

%Finds the first test done on each enzyme
enzymeIndexes = 2:testCount:testDataDimensions(2)+1;

%Creates a 3 Dimensional Array with each sheet representing an enzyme and
%it's corresponding tests.
for count = 1:5
   enzymeSets(:,:, count) = testData(: , ...
       enzymeIndexes(count):enzymeIndexes(count + 1) - 1);
end



