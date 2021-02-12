function axStim = plotSpatialStimulusInset(x0, y0, bg, fg, insetSize)
% Insert a spatial stimulus icon to the figure at set coordinates with set colors
%
% Syntax:  plotSpatialStimulusInset(x0, y0, bg, fg, insetSize)
%
% Inputs:
%    x0 - x-coordinate for the center
%    y0 - y-coordinate for the center
%    bg - background color
%    fg - foreground color
%    insetSize - size of the stimulus inset in centimeters
%
% Outputs:
%    axStim
%
% Example: 
%
% See also: documentation for "axes properties"

  
% Create axes for the stimulus icon
  axStim = axes('Units', 'centimeters', 'Position',...
    [x0-insetSize/2,y0-insetSize/2, insetSize, insetSize],...
    'DataAspectRatioMode', 'manual');
  
% Create and fill in a circle graphic:
  % Specify length of step along the radius of the circle
  % Set steps for the radius of the circle
  % Set a circle and fill it with colour
  dTheta = 0.05;
  thetas = [0:dTheta:(2*pi-dTheta), 0]; 
  fill(sin(thetas), cos(thetas), fg, 'EdgeColor', 'none');
  
% Create a square background (on the current axes, with limits, with no...
%   axis line color, filled in background color, and set aspect ratio)
  set(axStim, 'XLim', [-1.5, 1.5], 'YLim', [-1.5, 1.5], 'XColor', 'none',...
     'YColor', 'none', 'Color', bg, 'DataAspectRatio', [1, 1, 1]);

end