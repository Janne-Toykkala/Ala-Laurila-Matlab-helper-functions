function [fh, ahs] = getFigureWindow(nRows, nCols, params, ms, visible)
% Creates a new figure window
%
% Syntax:  getFigureWindow(nRows, nCols, params, ms, visible)
%
% Inputs:
%    nRows   - number of horizontal axes in the figure
%    nCols   - number of vertical axes in the figure
%    params  - parameters in an array, use function getParameterValue
%    ms      - true or false, default settings for manuscript
%    visible - true or false
%
% Outputs:
%    [fh, ahs]
%
% Example: 
%       [fh, ax] = getFigureWindow(1, 1, [figWidth, figHeight, axX0, axY0, axWidth, axHeight, 0, 0], true, true);
%       set(fh, 'CurrentAxes', ax)
%
% See also: -


% If number of input arguments < 5, or includes "visible"
%     set visible as "on".
%   Otherwise
%     set visible as "off".
  if nargin < 5 || visible
    visible = 'on';
  else
    visible = 'off';
  end

  % Parse parameters
  figWidth = params(1);
  figHeight = params(2);
  x0 = params(3);
  y0 = params(4);
  width = params(5);
  height = params(6);
  xSpace = params(7);
  ySpace = params(8);

  % Default settings 
  if ms
    set(0, 'DefaultAxesFontSize', getParameterValue('figTextFontSize'))
    set(0, 'DefaultTextFontSize', getParameterValue('figTextFontSize'))
    set(0, 'DefaultLegendFontSize', getParameterValue('figTextFontSize'))
    set(0, 'DefaultAxesLabelFontSizeMultiplier', 1)
    set(0, 'DefaultAxesTitleFontSizeMultiplier', 1)
    set(0, 'DefaultLineLineWidth', getParameterValue('figLineWidth'));
    set(0, 'DefaultLineMarkerSize', getParameterValue('figMarkerSize'));
  else
    set(0, 'DefaultAxesFontSize', 15)
    set(0, 'DefaultTextFontSize', 15)
    set(0, 'DefaultLegendFontSize', 15)
    set(0, 'DefaultLineLineWidth', 2);
    set(0, 'DefaultLineMarkerSize', 8);
    set(0, 'DefaultAxesTitleFontWeight', 'bold')
  end

  % Create figure
  fh = figure('Visible', 'on', 'units', 'centimeters', 'Position', [0, 0, figWidth, figHeight], 'PaperUnits', 'centimeters', 'PaperSize', [figWidth, figHeight], 'Visible', visible);

  % Create axes array with the following index notation
  %| 1 2 3 |
  %| 4 5 6 |
  %| 7 8 9 |

  axWidth = (width - (nCols-1)*xSpace) / nCols;
  axHeigt = (height - (nRows-1)*ySpace) / nRows;
  ahs = [];
  for i = nRows:-1:1
    for j= 1:nCols
      ahs(end+1) = axes('Units', 'centimeters', 'Position', [x0 + (j-1)*(axWidth+xSpace), y0 + (i-1)*(axHeigt+ySpace), axWidth, axHeigt], 'Color', 'none');
      hold on
    end
  end
  
end

