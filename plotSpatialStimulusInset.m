function ahStim = plotSpatialStimulusInset(x0, y0, bg, fg)
%rodsPerRGC - One line description of what the function or script performs (H1 line)
%
% Syntax:  rodsPerRGC = getRodsPerRGC(sigma, rodDensity, lim)
%
% Inputs:
%    x0 - x-coordiante for the center
%    y0 - y-coordiante for the center
%    bg - background color
%    fg - foreground color
%
% Outputs:
%    rodsPerRGC - weighted rod convergence per ganglion cell
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