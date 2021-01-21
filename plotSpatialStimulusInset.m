function ahStim = plotSpatialStimulusInset(x0, y0, bg, fg)
% Insert a spatial stimulus icon to the figure at specified coordinates with specified colours
%
% Syntax:  plotSpatialStimulusInset(x0, y0, bg, fg)
%
% Inputs:
%    x0 - x-coordinate for the center
%    y0 - y-coordinate for the center
%    bg - background color
%    fg - foreground color
%
% Outputs:
%    plotSpatialStimulusInset - figure icon of the spatial stimulus
%
% Example: 
%
% See also: 

  % Parameters
  stimSize = 0.4;     % cm
  
  ahStim = axes('Units', 'centimeters', 'Position', [x0-stimSize/2, y0-stimSize/2, stimSize, stimSize], 'DataAspectRatioMode', 'manual');
  dTheta = 0.05;
  thetas = [0:dTheta:(2*pi-dTheta), 0];
  fill(sin(thetas), cos(thetas), fg, 'EdgeColor', 'none');
  set(gca, 'XLim', [-1.5, 1.5], 'YLim', [-1.5, 1.5], 'XColor', 'none', 'YColor', 'none', 'Color', bg, 'DataAspectRatio', [1, 1, 1]);
%   axis equal

end