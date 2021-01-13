function [fh, ahs] = getFigureWindow(nRows, nCols, params, ms, visible)

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

