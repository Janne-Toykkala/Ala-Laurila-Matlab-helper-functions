function fixLegendIcons(icons, shift, horizontal)

% *description of the function*
% 
% Syntax:  fixLegendIcons(icons, shift, horizontal)
% 
% Inputs:
%    icons      - an array of icon objects
%    shift      - scalar value
%    horizontal - true or false
%
% Outputs:
%    fixLegendIcons - legend icons fixed to a position
%
% Example: -
%
% See also: - 

  lineCnt = 1;  % line alignment in legend
  textCnt = 1;  % text alignment in legend
  markCnt = 1;  % marker alignment in legend

  for icon = icons'
  
    if strcmp(icon.Type, 'hggroup') 
      chs = get(icon, 'Children');
      for ch = chs'
        if contains(ch.Type, 'group')
          chs2 = get(get(icon, 'Children'), 'Children');
          for icon2 = chs2'
            icon2.XData = icon2.XData + shift/2;
          end
        else
          if strcmp(ch.Type, 'patch')
            ch.XData([1, 2, 5]) = ch.XData([1, 2, 5]) + (lineCnt-1)*shift;
            ch.XData(3:4) = ch.XData(3:4) + lineCnt*shift;
%           ch.MarkerSize = ch.MarkerSize*0.5;
          else
            ch.FaceAlpha = 0.4;
            ch.XData(3:4) = ch.XData(3:4) + lineCnt*shift;
          end
        end
      end
      if horizontal
        lineCnt = lineCnt + 1;
      end
    end
   
% MODIFY LEGEND ICON TEXT
%   If the icons contains text:
%     Set the text position as current text position plus shift...
%            multiplied by text count.
%     Get the text font size from your list of parameters.
%     And if horizontal is true,
%       add 1 to text count.
    
    if strcmp(icon.Type, 'text')
      icon.Position = icon.Position + [textCnt*shift, 0, 0];
      icon.FontSize = getParameterValue('figTinyTextFontSize');
      if horizontal
        textCnt = textCnt + 1;
      end
    end

% MODIFY LEGEND ICON LINE
%   If icons contain line, and its style is solid,
%     set the range of x-coordinates as the existing range plus shift.
%     If horizontal is true,
%       add 1 to line count.
%
%   Otherwise, if icons contain line and its style is dotted,
%     set the range of x-coordinates as the existing range plus shift.
%     If horizontal is true,
%       add 1 to line count.
%
%   Otherwise, if icons contain line and its marker style is NOT "no marker",
%     set the range of x-coordinates as the existing range plus shift.
%     If horizontal is true,
%       add 1 to line count.  
    
    if strcmp(icon.Type, 'line') && strcmp(icon.LineStyle, '-')
      icon.XData = icon.XData + [(lineCnt-1)*shift, lineCnt*shift];
      if horizontal
        lineCnt = lineCnt + 1;
      end
    elseif strcmp(icon.Type, 'line') && strcmp(icon.LineStyle, ':')
      icon.XData = icon.XData + [(lineCnt-1)*shift, lineCnt*shift];
      if horizontal
        lineCnt = lineCnt + 1;
      end
    elseif strcmp(icon.Type, 'line') && ~strcmp(icon.Marker, 'none')
      icon.XData = icon.XData + (markCnt-0.5)*shift;
      if horizontal
        markCnt = markCnt + 1;
      end
    end
    
% MODIFY LEGEND BOX
%   If icon contains a filled polygonal area:
%     Move the range of x-coordinates that are from 1 to 2 by multiplicate of shift.
%     Move the range of x-coordinates that are from 3 to 4 by multiplicate of shift.

    if strcmp(icon.Type, 'patch')
      icon.XData(1:2) = icon.XData(1:2) + (lineCnt-1)*shift;
      icon.XData(3:4) = icon.XData(3:4) + lineCnt*shift;
      if horizontal
%         symCnt = symCnt + 1;
      end
    end
    
  end
  
end