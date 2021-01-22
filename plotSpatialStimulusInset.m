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
%    doc axes properties

% Parameters
  stimulusSize = 0.4;     % cm
  
  % Create axes for the stimulus icon
  ahStim = axes('Units', 'centimeters', 'Position',...
  [x0-stimulusSize/2,y0-stimulusSize/2, stimulusSize, stimulusSize],...
  'DataAspectRatioMode', 'manual');
  
  % Create and fill in a circle graphic
  dTheta = 0.05;
  thetas = [0:dTheta:(2*pi-dTheta), 0]; 
  fill(sin(thetas), cos(thetas), fg, 'EdgeColor', 'none');
  
  % Create a square background for the circle, on the current axes, with no
  % axis line colour
  set(gca, 'XLim', [-1.5, 1.5], 'YLim', [-1.5, 1.5], 'XColor', 'none', 'YColor', 'none', 'Color', bg, 'DataAspectRatio', [1, 1, 1]);
  % "gca" = current axes

end