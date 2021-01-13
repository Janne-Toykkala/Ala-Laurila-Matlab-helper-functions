function [ahBottom, ahTop] = splitLogYAxis(ah, xLim, xTicks, yLim, yTicks, hBottom, dy)

  ahBottom = ah;
  ahTop = axes('Units', get(ahBottom, 'Units'), 'Position', get(ahBottom, 'Position'), 'Color', 'none');
  hold on
  
  set(ahBottom, 'Position', get(ahBottom, 'Position').*[1, 1, 1, 0] + [0, 0, 0, hBottom])
  set(ahBottom, 'xLim', xLim, 'XTick', xTicks, 'YLim', [-1, 1], 'YTick', 0, 'YTickLabels', 'Dark')
  set(ahBottom, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off','YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', ahBottom)
  text(xLim(1), 1, '\\', 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 20, 'Color', get(gca, 'YColor'))
  
  set(ahTop, 'Position', get(ahTop, 'Position') + [0, hBottom+dy, 0, -hBottom-dy])
  set(ahTop, 'XLim', xLim, 'XTick', xTicks, 'yLim', yLim, 'YTick', yTicks, 'YScale', 'log')
  set(ahTop, 'XColor', 'none')
  set(ahTop, 'XGrid', 'off','XMinorGrid', 'off', 'YGrid', 'off','YMinorGrid', 'off')
  set(gcf, 'CurrentAxes', ahTop)
  text(xLim(1), yLim(1), '\\', 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 20, 'Color', get(gca, 'YColor'))
  
end