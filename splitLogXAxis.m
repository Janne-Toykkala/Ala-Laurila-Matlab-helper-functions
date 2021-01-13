function [ahLeft, ahRight] = splitLogXAxis(ah, xLim, yLim, xTicks, yTicks, wLeft, dx)

  ahLeft = ah;
  ahRight = axes('Units', get(ahLeft, 'Units'), 'Position', get(ahLeft, 'Position'), 'Color', 'none');
  hold on
  
  set(ahLeft, 'Position', get(ahLeft, 'Position').*[1, 1, 0, 1] + [0, 0, wLeft, 0])
  set(ahLeft, 'XLim', [-1, 1], 'XTick', 0, 'XTickLabels', 'Dark^{ }', 'yLim', yLim, 'YTick', yTicks)
  set(ahLeft, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off','YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', ahLeft)
  text(1, yLim(1), '/', 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Color', get(gca, 'XColor'))
  
  set(ahRight, 'Position', get(ahRight, 'Position') + [wLeft+dx, 0, -wLeft-dx, 0])
  set(ahRight, 'XLim', xLim, 'XTick', xTicks, 'yLim', yLim, 'YTick', yTicks, 'yTickLabels', [])
  set(ahRight, 'XScale', 'log')
  set(ahRight, 'YColor', 'none', 'Color', 'none')
  set(ahRight, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off','YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', ahRight)
  text(xLim(1), yLim(1), '/', 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Color', get(gca, 'XColor'))
  
end