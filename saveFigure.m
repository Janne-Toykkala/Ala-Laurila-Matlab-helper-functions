function saveFigure(name)
  if exist('export_fig', 'file')
    export_fig(name, '-pdf', '-transparent', '-painters', '-nocrop')
  else
    print(name, '-dpng', '-r300')
  end
end
