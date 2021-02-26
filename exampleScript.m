% EXAMPLE SCRIPT TO SHOWCASE THE USE OF ALA-LAURILA LAB HELPER FUNCTIONS
% 
% Description - This script file will load data, plot it, and save it. The
% used functions are getFigureWindow, getParameterValue,
% plotSpatialStimulus, splitLogXAxis, and saveFigure.
% 
% Author - Janne Töykkälä, Ala-Laurila lab, Aalto University
% 
% Date of creation - 18th February 2021
% _________________________________________________________________________

% Clear variables and functions from memory. Close all the open figure
% windows. Clear command window.
clear; close all; clc;

% Load data
data = importdata('exampleData.csv');
x = data(:,1);
y = data(:,2);

% Least squares fit using Naka-Rushton equation and Hill equation
fit = fitNakaRushton(x, y, []);
hillFun = @(x) fit.offset + (fit.Rmax-fit.offset) * (x.^fit.n) ./ ...
    ((x.^fit.n) + fit.c50.^fit.n);

% Fetch parameters for the figure window
figWidth    = getParameterValue('figWidth');
figHeight   = getParameterValue('figHeight');
axX0        = getParameterValue('figAxX0');
axY0        = getParameterValue('figAxY0');
axWidth     = getParameterValue('figAxWidth');
axHeight    = getParameterValue('figAxHeight');

% Set up the figure window
%[fh, ax] = getFigureWindow(1, 1, [figWidth, figHeight, axX0, axY0, axWidth,... 
%    axHeight, 0, 0], false);
[fh, ax] = getFigureWindow(1, 1, [21, 15, 1, 1, 19, 13, 0, 0,],true);
set(fh, 'CurrentAxes', ax);

% Split the x-axis
[axLeft, axRight] = splitLogXAxis(ax, [0.0012,100], [0,1], ...
    [0.01,0.1,1,10,100], [0:0.2:1], 3, 0.1, 'Dark');

% Plot on the right axis
set(gcf, 'CurrentAxes', axRight);
phs = [];
phs(end+1) = plot(data(:,1), data(:,2), 'o', 'Display', 'Data');
phs(end+1) = plot(x, hillFun(x), 'k-', 'Display','Fit');
xlabel('Light intensity (R*/rod/s)');
ylabel('Fraction of correct choices');
labelPanel('1a)');

% Plot on the left axis
set(gcf, 'CurrentAxes', axLeft);
plot(data(:,1), data(:,2), 'o', 'Display', 'Data');
plot(x, hillFun(x), 'k-', 'Display','Fit');

% Set the legend on the left axis
[lh, icons] = legend(phs);
fixLegendIcons(icons, -0.2, false)
fixLegendPos(lh)

% save figure
% fix legend icons
% new x-axis on top
% Combine fix legend icons with fix legend pos?

% Plot icons of the spatial stimulus
insets = [2.5 4.1 7.1 10.3 13.5 16.7 20]
for n = 1
    for m = 0
        while n <= numel(insets);
            plotSpatialStimulusInset(insets(n), 2.1, 'k', m*[1, 1, 1], 0.5);
            n = n+1;
            m = m + 1/numel(insets);
        end
    end
end

function fixLegendPos(lh)
  lh.Box = 'off';
  lh.Units = 'centimeters';
  
  legendPos = lh.Position;
  axesPos = get(gca, 'Position');
  
  % Place the legend in the upper left corner
  delta = 0.1;
  lh.Position(1:2) = [axesPos(1)+delta, axesPos(2)+axesPos(4)-legendPos(4)-delta];

end

function labelPanel(label)
  axesPos = get(gca, 'Position');
  delta = 0.2;
  % Place the label in the upper left corner
  text(-2*delta, delta+axesPos(4), label, 'Units', 'centimeters',...
      'FontSize', getParameterValue('figLabelFontSize'),...
      'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom',...
      'FontWeight', 'bold');
end