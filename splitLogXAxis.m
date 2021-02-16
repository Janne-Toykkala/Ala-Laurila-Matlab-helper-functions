function [axLeft, axRight] = splitLogXAxis(ax, xLim, yLim, xTicks, yTicks, wLeft, dx, leftLabel)
% Splits figure into two vertical sections on the x-axis
%
% Syntax:  splitLogXAxis(ax, xLim, yLim, xTicks, yTicks, wLeft, dx)
%
% Inputs:
%    ax     - axis handle
%    xLim   - x-axis limits in an array
%    yLim   - y-axis limits in an array
%    xTicks - points for x-axis ticks in an array
%    yTicks - points for y-axis ticks in an array
%    wLeft  - width of x-axis segment on the left side
%    dx     - width of gap between axes
%
% Outputs: [axLeft, axRight]
%
% Example: 
%    splitLogXAxis(ax, [0.1,5], [-1,2], [0,0.2,0.5,1:1:5], [-1:1:2], 2, 0.5, 'Dark')
%
% See also: -


% Axis on the left has the same values as axis handle.
% Axis on the right has the same units and position as the axis on the left.
  axLeft = ax;
  axRight = axes('Units', get(axLeft, 'Units'), 'Position',...
      get(axLeft, 'Position'), 'Color', 'none');
  hold on
  
% MODIFY GRAPHICS PROPERTIES FOR THE LEFT SIDE AXIS
% Set the position of left side axis and set its width (via multiplying...
%       the position by zero and then adding 'wLeft' to it)
% Set limits of the left axes, their tick positions, and tick labels
% Set grids of the left axes
% Plot the current axes as the left axis
% Set a slash symbol to the end of the left side axis
  set(axLeft, 'Position', get(axLeft, 'Position').*[1, 1, 0, 1] + [0, 0, wLeft, 0])
  set(axLeft, 'XLim', [-1, 1], 'XTick', 0, 'XTickLabels', leftLabel,...
      'yLim', yLim, 'YTick', yTicks)
  set(axLeft, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off',...
      'YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', axLeft)
  text(1, yLim(1), '/', 'VerticalAlignment', 'middle',...
      'HorizontalAlignment', 'center', 'Color', get(gca, 'XColor'))
  
% MODIFY GRAPHICS PROPERTIES OF THE RIGHT SIDE AXIS
% Set position of right side axis (start after left side axis and gap)
% Set limits of the right axes, and their ticks
% Set the colors for the right side y-axis
% Set grids for the right axes
% Plot the current axes as the right axis
% Set a slash symbol to the beginning of the right side axis
  set(axRight, 'Position', get(axRight, 'Position') + [wLeft+dx, 0, -wLeft-dx, 0])
  set(axRight, 'XLim', xLim, 'XTick', xTicks, 'yLim', yLim, 'YTick', yTicks,...
      'yTickLabels', [])
  set(axRight, 'XScale', 'log')
  set(axRight, 'YColor', 'none', 'Color', 'none')
  set(axRight, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off',...
      'YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', axRight)
  text(xLim(1), yLim(1), '/', 'VerticalAlignment', 'middle',...
      'HorizontalAlignment', 'center', 'Color', get(gca, 'XColor'))
  
end