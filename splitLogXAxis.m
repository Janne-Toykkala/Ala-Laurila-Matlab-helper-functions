function [ahLeft, ahRight] = splitLogXAxis(ah, xLim, yLim, xTicks, yTicks, wLeft, dx)
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
%    splitLogXAxis(ax, [0.1,5], [-1,2], [0,0.2,0.5,1:1:5], [-1:1:2], 2, 0.5)
%
% See also: -


% Axis on the left equals to axis handle.
% Axis on the right has the same units and position as the axis on the left.
  ahLeft = ah;
  ahRight = axes('Units', get(ahLeft, 'Units'), 'Position', get(ahLeft, 'Position'), 'Color', 'none');
  hold on
  
% Set a graphics properties for the left side axis
%  Set the position of left side axis and set its width (via multiplying...
%       the position by zero and then adding 'wLeft' to it)
%  y-axis starting point
%  Set limits of the left axes, their tick positions, and tick labels
%  Set grids of the left axes
%  Plot the current axes as the left axis
%  Set a slash symbol to the end of the left side axis
  set(ahLeft, 'Position', get(ahLeft, 'Position').*[1, 1, 0, 1] + [0, 0, wLeft, 0])
  set(ahLeft, 'XLim', [-1, 1], 'XTick', 0, 'XTickLabels', 'Dark^{ }', 'yLim', yLim, 'YTick', yTicks)
  set(ahLeft, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off','YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', ahLeft)
  text(1, yLim(1), '/', 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Color', get(gca, 'XColor'))
  
% Set a graphics properties for the right side axis
%  Set position of right side axis (start after left side axis and gap)
%  Set limits of the right axes and their ticks
%  Set the colors for the right side axis
%  Set grids for the right axes
%  Plot the current axes as the right axis
%  Set a slash symbol to the beginning of the right side axis
  set(ahRight, 'Position', get(ahRight, 'Position') + [wLeft+dx, 0, -wLeft-dx, 0])
  set(ahRight, 'XLim', xLim, 'XTick', xTicks, 'yLim', yLim, 'YTick', yTicks, 'yTickLabels', [])
  set(ahRight, 'XScale', 'log')
  set(ahRight, 'YColor', 'none', 'Color', 'none')
  set(ahRight, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off','YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', ahRight)
  text(xLim(1), yLim(1), '/', 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Color', get(gca, 'XColor'))
  
end