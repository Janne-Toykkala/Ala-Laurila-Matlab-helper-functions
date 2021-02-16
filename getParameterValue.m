function val = getParameterValue(param, returnSuggestions)
% Fetches your parameter values from the script. A bit like a library.
%
% Syntax:      getParameterValue(param)
%
% Inputs:
%    param   - name of the parameter
%    returnSuggestions - true or false
%
% Outputs:
%    val
%
% Example: 
%    >> getParameterValue('width', true)
%
% See also: -

  params = containers.Map;

  % Paths
  params('figureDir') = 'Figure panels';
  
  % Constants and parameters
  params('h') = 6.62607015 * 10.^-34;	% Js, Planck's constant
  params('c') = 299792458;              % m/s, speed of light
  params('tauMedia') = 0.55             % Fraction of photons absorded in the eye
  
  % Figure panels
  params('figLineWidth') = 1.5;
  params('figMarkerSize') = 5;
  params('figLabelFontSize') = 10;
  params('figTextFontSize') = 8;
  params('figTinyTextFontSize') = 6;
  params('figHeight') = 5;
  params('figWidth') = 8.0;
  params('figAxX0') = 1.2;
  params('figAxY0') = 1.2;
  params('figAxHeight') = 3.;
  params('figAxWidth') = 6.;
  
  % Colors
  params('colorBlue') = [0, 0.4470, 0.7410];
  params('colorRed') = [0.8500, 0.3250, 0.0980];
  params('colorGreen') = [0.4660, 0.6740, 0.1880];
  params('colorGray') = 0.5*[1, 1, 1];
  params('colorFading') = 0.5;

% Return the requested value, or print a warning message
% If map 'params' contains the key written in the argument,
%   return the value corresponding to that key.
% Otherwise,
%   if number of arguments in more than 1 and returnSuggestions is true
%     return keys of map 'params'
%     return value as key(/s) that contain the string or the pattern
%   Otherwise,
%     value is not a number
%     print "WARNING: no parameter 'param name' defined" and start a new line.
  if params.isKey(param)
    val = params(param);
  else
    if nargin > 1 && returnSuggestions
      keys = params.keys;
      val = keys(contains(keys, param));
    else
      val = nan;
      fprintf('WARNING: no parameter %s defined\n', param)
    end
  end
  
end