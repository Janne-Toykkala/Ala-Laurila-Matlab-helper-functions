function[axBottom, axTop] = splitLogYAxis(ax, xLim, yLim, xTicks, yTicks, hBottom, dy, bottomLabel)
% Splits figure into two horizontal sections on the y-axis
%
% Syntax:  splitLogYAxis(ax, xLim, xTicks, yLim, yTicks, hBottom, dy)
%
% Inputs:
%    ax      - axis handle
%    xLim    - x-axis limits in an array
%    yLim    - y-axis limits in an array
%    xTicks  - points for x-axis ticks in an array
%    yTicks  - points for y-axis ticks in an array
%    hBottom - height of y-axis segment on the bottom
%    dy      - length of the gap between axes
%    bottomLabel - string, text label for the bottom axis
%
% Outputs: [axBottom, axTop]
%
% Example: 
%    splitLogYAxis(ah, [-2, 2], [0, 1], [-5:1:5], [0.2, 0.5, 1], 2, 0.1, 'Control')
%
% See also: -


% ASSIGNING THE AXES
% Bottom axis has the same values as axis handle.
% Top axis has the same units and position as the axis on the left.
  axBottom = ax;
  axTop = axes('Units', get(axBottom, 'Units'), 'Position',...
      get(axBottom, 'Position'), 'Color', 'none', 'NextPlot', 'add');
  
% SET GRAPHICS PROPERTIES FOR THE BOTTOM AXIS
% Set the position of the bottom axis, and set its height (via multiplying...
%       the position by zero and then adding 'hBottom' to it)
% Set limits of the bottom axes, their tick positions, and tick labels
% Set grids of the bottom axes
% Plot the current axes as the bottom axis
% Set a slash symbol to the end of the bottom axis
  set(axBottom, 'Position', get(axBottom, 'Position').*[1, 1, 1, 0] + [0, 0, 0, hBottom])
  set(axBottom, 'xLim', xLim, 'XTick', xTicks, 'YLim', [-1, 1],...
      'YTick', 0, 'YTickLabels', bottomLabel)
  set(axBottom, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off',...
      'YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', axBottom)
  text(xLim(1), 1, '\\', 'VerticalAlignment', 'middle', 'HorizontalAlignment',...
      'center', 'Rotation', 20, 'Color', get(gca, 'YColor'))
  
% SET GRAPHICS PROPERTIES FOR THE TOP AXIS
% Set position of the top axis (start after the bottom axis and the gap)
% Set limits of the top axes, and their ticks
% Set the colors for the top x-axis
% Set grids for the top axes
% Plot the current axes as the top axis
% Set a slash symbol to the beginning of the top y-axis
  set(axTop, 'Position', get(axTop, 'Position') + [0, hBottom+dy, 0, -hBottom-dy])
  set(axTop, 'XLim', xLim, 'XTick', xTicks, 'yLim', yLim, 'YTick', yTicks, 'YScale', 'log')
  set(axTop, 'XColor', 'none')
  set(axTop, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off','YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', axTop)
  text(xLim(1), yLim(1), '\\', 'VerticalAlignment', 'middle',...
      'HorizontalAlignment', 'center', 'Rotation', 20, 'Color', get(gca, 'YColor'))
  
end