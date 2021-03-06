function [fh, axs] = getFigureWindow(varargin)
% Creates a new figure window
%
% Syntax:  getFigureWindow(nRows, nCols, params, ms, visible)
%
% Inputs:
%    nRows   - number of horizontal axes in the figure
%    nCols   - number of vertical axes in the figure
%    params  - parameters in an array, use function getParameterValue
%    ms      - true or false, optional argument, settings for manuscript
%    visible - 'on' or 'off', optional argument
%
% Outputs:
%    [fh, ahs]
%
% Example: 
%       [fh, ax] = getFigureWindow(1, 1, [figWidth, figHeight, axX0, axY0,...
%           axWidth, axHeight, 0, 0]);
%       set(fh, 'CurrentAxes', ax)
%
% See also: -


% Argument input validation
  p = inputParser;
  defaultVal = false;  % The default value for 'ms'
  defaultVal2 = 'on';  % The default value for 'visible'
  validationFcn = @(s) isnumeric(s) && isscalar(s);
  addRequired(p,'nRows',validationFcn)
  addRequired(p,'nCols',validationFcn)
  addRequired(p,'params')
  addOptional(p,'ms',defaultVal,@islogical)
  addOptional(p,'visible',defaultVal2,@isstring);
  parse(p,varargin{:});
  a = p.Results;

% Parse parameters
  figWidth  = a.params(1);
  figHeight = a.params(2);
  x0        = a.params(3);
  y0        = a.params(4);
  width     = a.params(5);
  height    = a.params(6);
  xSpace    = a.params(7);
  ySpace    = a.params(8);

% Default settings for a manuscript
  if a.ms
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
  fh = figure('Visible', 'on', 'units', 'centimeters', 'Position',... 
      [0, 0, figWidth, figHeight], 'PaperUnits', 'centimeters',... 
      'PaperSize', [figWidth, figHeight], 'Visible', a.visible);

% Create axes array with the following index notation
%| 1 2 3 |
%| 4 5 6 |
%| 7 8 9 |

  axWidth = (width - (a.nCols-1)*xSpace) / a.nCols;
  axHeigt = (height - (a.nRows-1)*ySpace) / a.nRows;
  axs = [];
  for i = a.nRows:-1:1
    for j= 1:a.nCols
      axs(end+1) = axes('Units', 'centimeters', 'Position',... 
          [x0 + (j-1)*(axWidth+xSpace), y0 + (i-1)*(axHeigt+ySpace),...
          axWidth, axHeigt], 'Color', 'none', 'NextPlot', 'add');
    end
  end
  
end